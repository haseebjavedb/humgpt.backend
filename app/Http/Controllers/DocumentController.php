<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Chat;
use App\Models\Message;
use App\Models\GptInstruction;
use App\Models\GptRole;
use App\Models\Prompt;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\StreamedResponse;
use PhpOffice\PhpWord\Element\Table;
use PhpOffice\PhpWord\Element\Text;
use PhpOffice\PhpWord\Element\TextRun;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\PhpWord;
use Spatie\PdfToText\Pdf;
use Smalot\PdfParser\Parser;
use Illuminate\Support\Str;
use carbon\Carbon;
use App\Models\User;
use Illuminate\Support\Facades\DB;



class DocumentController extends Controller




{

    public function getApiKey()
    {
        try {
            $apiKey = DB::table('api_keys')->value('api_key');

            if ($apiKey) {
                return $apiKey;
            } else {
                throw new \Exception('API key not found');
            }
        } catch (\Exception $e) {
            // Log the error for debugging
            Log::error('Error fetching API key: ' . $e->getMessage());

            return null; // or handle the error appropriately
        }
    }

    private $api_Key; // Declare api_Key property

    public function __construct()
    {
        $this->api_Key = $this->getApiKey(); // Initialize api_Key in the constructor
    }
    
   
    
    public function getModel()
    {
        try {
            $model = DB::table('api_keys')->value('model');

            if ($model) {
                return $model;
            } else {
                throw new \Exception('Model not found');
            }
        } catch (\Exception $e) {
            // Log the error for debugging
            Log::error('Error fetching model: ' . $e->getMessage());

            return null; // or handle the error appropriately
        }
    } 


    public function uploadDoc(Request $request)
    { { // Validate input
         $model = $this->getModel();

            if ( !$model) {
                return response()->json(['error' => 'API key or model not found'], 404);
            }

            $userId = Auth::id();
            $UserInput = $request->UserInput;
            $prompt_id = $request->prompt_id;
            $chatid = $request->chatid;

            $user = User::find($userId);

            // Convert subscribed_date and expiration_date to Carbon instances
            $subscribedDate = Carbon::parse($user->subscribed_date);
            $expirationDate = Carbon::parse($user->expire_date);

            if (($user->no_words <= $user->used_words) || ($subscribedDate->gt($expirationDate))) {
                return response()->json(['message' => 'Your plan has expired. Kindly subscribe to continue using the service.', 'code' => 503], 503);
            }

            // Check if a chat with the provided chatid exists
            $chat = Chat::firstOrCreate(['chatid' => $chatid], [
                'user_id' => $userId,
                'chat_message' => $UserInput,
                'prompt_question_id' => $prompt_id
            ]);

            // Fetch the GPT role associated with the prompt_id
            $gpt_role = GptRole::where('prompt_question_id', $prompt_id)->first();
            $role = $gpt_role ? $gpt_role->role : "You are a helpful assistant";

            // Process file upload
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $extension = $file->extension();
                $file_name = time() . "-" . str_replace(" ", "_", $file->getClientOriginalName());
                $file->storeAs('uploads/documents', $file_name, 'public');

                $file_path = storage_path('app/public/uploads/documents/' . $file_name);
                $content = '';
                if ($extension == 'pdf') {
                    $content = $this->convert_from_latin1_to_utf8_recursively($this->readPdfFile($file_path));
                } elseif ($extension == 'docx') {
                    $content = $this->convert_from_latin1_to_utf8_recursively($this->readDocxFile($file_path));
                }

                $UserInput = $content . "\n" .  $UserInput;
            }

            $userMessage = new Message();
            $userMessage->user_id = $userId;
            $userMessage->chat_id = $chat->id;
            $userMessage->message = $UserInput;
            $userMessage->is_bot = 0; // User message
            $userMessage->is_hidden = 0;
            $userMessage->is_included = 1;
            $userMessage->save();


            // Prepare for API call
            $messages = Message::where('chat_id', $chat->id)->get();
            $history = [];
            foreach ($messages as $message) {
                $role = $message->is_bot ? "system" : "user";
                $history[] = [
                    'role' => $role,
                    'content' => $message->message,
                ];
            }

            // Initialize the Guzzle HTTP client
            $client = new Client();
            $prompt =   $UserInput;
            $response = new StreamedResponse(function () use ($client, $prompt, $role, &$chat, $userId, $history, $model) {
                $message = "";
                // Make a POST request to the GPT API
                $res = $client->post('https://api.openai.com/v1/chat/completions', [
                    'headers' => [
                        'Authorization' => "Bearer " . $this->api_Key,
                        'Content-Type' => 'application/json',
                    ],
                    'json' => [
                        'model' =>  $model,
                        'messages' => $history,
                        'temperature' => 1,
                        'stream' => true,
                    ],
                    'stream' => true,
                ]);
                // Read the response from the GPT API
                $buffer = '';
                while (!$res->getBody()->eof()) {
                    $buffer .= $res->getBody()->read(1024);
                    while (($endOfJson = strpos($buffer, "\n")) !== false) {
                        $json = substr($buffer, 0, $endOfJson);
                        $buffer = substr($buffer, $endOfJson + 1);
                        if ($json) {
                            $output = $this->responseDecode($json);
                            $message .= $output;
                            echo $output; // Output the response
                            ob_flush();
                            flush();

                            $userObj = User::find($userId);
                            $used = $userObj->used_words;
                            $used += str_word_count($output);
                            $userObj->used_words = strval($used);
                            $userObj->save();
                        }
                    }
                }

                if (!empty($message)) {
                    $botMessage = new Message();
                    $botMessage->user_id = $userId;
                    $botMessage->chat_id = $chat->id;
                    $botMessage->message = $message;
                    $botMessage->is_bot = 1; // Bot message
                    $botMessage->is_hidden = 0;
                    $botMessage->is_included = 1;
                    $botMessage->save();
                }
            });

            return $response;
        }
    }










    public function gptResponse(Request $request)
    {
        $chatid = $request->chatid;
        $chat = Chat::where('chatid', $chatid)->first();
        $input = $request->input;
        $userId = $chat->user_id;
        $msg = new Message();
        $msg->user_id = $userId;
        $msg->chat_id = $chat->id;
        $msg->message = $input;
        $msg->is_bot = 0;
        $msg->is_hidden = 0;
        $msg->is_included = 1;
        $msg->save();
        $user = User::find($userId);

        // Convert subscribed_date and expiration_date to Carbon instances
        $subscribedDate = Carbon::parse($user->subscribed_date);
        $expirationDate = Carbon::parse($user->expire_date);

        if (($user->no_words <= $user->used_words) || ($subscribedDate->gt($expirationDate))) {
            return response()->json(['message' => 'Your plan has expired. Kindly subscribe to continue using the service.', 'code' => 503], 503);
        }

        $messages = Message::where('chat_id', $chat->id)->get();
        $history = [];
        foreach ($messages as $message) {
            if ($message->is_bot == 1) {
                $role = "system";
            } else {
                $role = "user";
            }
            array_push($history, [
                'role' => $role,
                'content' => $message->message,
            ]);
        }
        $prompt_question_id = $chat->prompt_question_id;
        $gpt_role = GptRole::where('prompt_question_id', $prompt_question_id)->first();
        $role = "";
        if ($gpt_role) {
            $role = $gpt_role->role;
        } else {
            $role = "You are a helpful assistant";
        }
        $client = new Client();
        $prompt = $input;
        $response = new StreamedResponse(function () use ($client, $prompt, $role, &$chat, $userId, $history) {
            $message = "";
            // Make a POST request to the GPT API
            $res = $client->post('https://api.openai.com/v1/chat/completions', [
                'headers' => [
                    'Authorization' => "Bearer " . $this->api_Key,
                    'Content-Type' => 'application/json',
                ],
                'json' => [
                    'model' => "gpt-4-1106-preview",
                    'messages' => $history,
                    'temperature' => 1,
                    'stream' => true,
                ],
                'stream' => true,
            ]);

            // Read the response from the GPT API
            $buffer = '';
            while (!$res->getBody()->eof()) {
                $buffer .= $res->getBody()->read(1024);
                $string = '';
                while (($endOfJson = strpos($buffer, "\n")) !== false) {
                    $json = substr($buffer, 0, $endOfJson);
                    $buffer = substr($buffer, $endOfJson + 1);
                    $data = $json;
                    if ($json) {
                        $output = $this->responseDecode($json);
                        $string .= $output;
                    }
                }
                // Output the response
                $message .= $string;
                echo $string;
                ob_flush();
                flush();

                $userObj = User::find($userId);
                $used = $userObj->used_words;
                $used += str_word_count($string);
                $userObj->used_words = strval($used);
                $userObj->save();
            }

            $msg = new Message();
            $msg->user_id = $userId;
            $msg->chat_id = $chat->id;
            $msg->message = $message;
            $msg->is_bot = 1;
            $msg->is_hidden = 0;
            $msg->is_included = 1;
            $msg->save();
        });

        return $response;
    }


    public function readDocxFile($filePath)
    {
        try {
            $phpWord = IOFactory::load($filePath);

            $content = '';

            foreach ($phpWord->getSections() as $section) {
                foreach ($section->getElements() as $element) {
                    if ($element instanceof TextRun) {
                        $content .= $element->getText();
                    } elseif ($element instanceof Text) {
                        $content .= $element->getText();
                    } elseif ($element instanceof Table) {
                        foreach ($element->getRows() as $row) {
                            foreach ($row->getCells() as $cell) {
                                $content .= $cell->getText() . "\t";
                            }
                            $content .= "\n";
                        }
                    }
                }
            }

            return $content;
        } catch (\Exception $e) {
            // Handle any exceptions that might occur during the process
            return "Error: " . $e->getMessage();
        }
    }

    function readPdfFile($filePath)
    {
        $parser = new Parser();

        try {
            $pdf = $parser->parseFile($filePath);
            $text = $pdf->getText();
        } catch (\Exception $e) {
            // Handle any exceptions that occur during parsing
            $text = "Error reading PDF: " . $e->getMessage();
        }

        return $text;
    }

    public static function convert_from_latin1_to_utf8_recursively($dat)
    {
        if (is_string($dat)) {
            return utf8_encode($dat);
        } elseif (is_array($dat)) {
            $ret = [];
            foreach ($dat as $i => $d) {
                $ret[$i] = self::convert_from_latin1_to_utf8_recursively($d);
            }

            return $ret;
        } elseif (is_object($dat)) {
            foreach ($dat as $i => $d) {
                $dat->$i = self::convert_from_latin1_to_utf8_recursively($d);
            }

            return $dat;
        } else {
            return $dat;
        }
    }


    public function responseDecode($string)
    {
        $string = substr($string, 6);
        if ($string !== "[DONE]") {
            $decodes = json_decode($string, true);
            // echo "<pre>";
            // print_r($decodes['choices'][0]['delta']['content']);
            if ($decodes) {
                if (isset($decodes['choices'][0]['delta']['content'])) {
                    $output = $decodes['choices'][0]['delta']['content'];
                } else {
                    $output = "";
                }
            } else {
                // Find the start of the JSON structure
                $jsonStartPos = strpos($string, '{"content":');
                // Get the index of },"finish_reason"
                $jsonEndPos = strpos($string, ',"finish_reason"');
                // Extract the substring from start to end index
                $substring = substr($string, $jsonStartPos + 12, $jsonEndPos - ($jsonStartPos + 14));

                // Print the extracted substring
                $output = $substring;
                // echo $jsonStartPos;
                // echo $content;
            }
            return $output;
        }
        return "";
    }



    public function generateChatId()
    {
        $part1 = Str::random(5);
        $part2 = Str::random(5);
        $part3 = Str::random(5);
        $part4 = Str::random(5);
        $chatId = $part1 . "-" . $part2 . "-" . $part3 . "-" . $part4;
        return $chatId;
    }


    public function uploadDoc2(Request $request)
    {
        $userId = Auth::id();
        $input = $request->userInput;

        $chat = new Chat();
        $chat->chatid = $this->generateChatId();
        $chat->user_id = $userId;
        $chat->chat_message = $input;
        $chat->save();

        // Process file upload if a file is provided
        // Process file upload
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $extension = $file->extension();
            $file_name = time() . "-" . str_replace(" ", "_", $file->getClientOriginalName());
            $file->storeAs('uploads/documents', $file_name, 'public');

            $file_path = storage_path('app/public/uploads/documents/' . $file_name);
            $content = '';
            if ($extension == 'pdf') {
                $content = $this->convert_from_latin1_to_utf8_recursively($this->readPdfFile($file_path));
            } elseif ($extension == 'docx') {
                $content = $this->convert_from_latin1_to_utf8_recursively($this->readDocxFile($file_path));
            }

            $UserInput = $content . "\n" .   $input;
        }

        return $chat;
    }

    public function getChatHistory(Request $request)
    {
        $userId = $request->user_id;

        // Retrieve chat records for the specified user, ordered by ID in descending order
        $chats = Chat::with('prompt_question', 'prompt_question.category')
            ->where('user_id', $userId)
            ->orderBy('id', 'DESC')
            ->get();

        return response()->json($chats, 200);
    }



    public function singleChat2($chatid)
    {

        $chat = Chat::with('messages')->where('chatid', $chatid)->first();
        return response()->json($chat, 200);
    }
}
    
    
        

    







 // public function uploadDocument(Request $request)
    // {
    //     try {
    //         // $chatid = "qbFLw-hN154-IgyVJ-eUdTe";
    //         // $userId = Auth::id();
    //         // $chat = Chat::where('chatid', $chatid)->first();
    //         // if (!$chat) {
    //         //     // Handle the case when $chat is null
    //         //     return response()->json(["message" => "Chat not found"], 404);
    //         // }
    //         // $answers = Answer::with('question')->where('chat_id', $chat->id)->get();
    //         // $ques = [];
    //         // $prompt_question_id = 0;

    //         // foreach ($answers as $answer) {
    //         //     if (isset($answer->question) && isset($answer->question->prompt_question_id)) {
    //         //         $prompt_question_id = $answer->question->prompt_question_id;
    //         //         $ques[$answer->question->key] = $answer->answer;
    //         //     }
    //         // }

    //         // $prompt_obj = Prompt::where('prompt_question_id', $prompt_question_id)->first();

    //         // if (!$prompt_obj) {
    //         //     // Handle the case when $prompt_obj is null
    //         //     return response()->json(["message" => "Prompt not found"], 404);
    //         // }

    //         // $input = $prompt_obj->prompt;

    //         // foreach ($ques as $key => $value) {
    //         //     $placeholderWithoutSpaces = '{' . $key . '}';
    //         //     $placeholderWithSpaces = '{ ' . $key . ' }';
    //         //     $input = str_replace($placeholderWithoutSpaces, $value, $input);
    //         //     $input = str_replace($placeholderWithSpaces, $value, $input);
    //         // }

    //         // $gpt_role = GptRole::where('prompt_question_id', $prompt_question_id)->first();
    //         // $prompt = "";
    //         // $role = "";

    //         // if ($gpt_role) {
    //         //     $role = $gpt_role->role;
    //         //     $gpt_instructions = GptInstruction::where('gpt_role_id', $gpt_role->id)->get();

    //         //     $prompt .= "<Instructions>";

    //         //     foreach ($gpt_instructions as $gpt_instruction) {
    //         //         $prompt .= "$gpt_instruction->instruction \n";
    //         //     }

    //         //     $prompt .= "</Instructions>\n\n";
    //         // } else {
    //         //     $role = "You are a helpful assistant";
    //         // }

    //         $role = "You are a helpful assistant";
    //         $prompt = $$request->userInput;

    //         // Check if file is present in the request
    //         if ($request->hasFile('file')) {
    //             $file = $request->file('file');
    //             $path = $file->store('documents', 'public');
    //             $prompt .= "\nFile Path: " . Storage::url($path);
    //         }

    //         $client = new Client();

    //         $response = new StreamedResponse(function () use ($client, $prompt, $role) {
    //             // Make a POST request to the GPT API
    //             $res = $client->post('https://api.openai.com/v1/chat/completions', [
    //                 'headers' => [
    //                     'Authorization' => "Bearer " . $this->api_Key,
    //                     'Content-Type' => 'application/json',
    //                 ],
    //                 'json' => [
    //                     'model' => "gpt-4-1106-preview",
    //                     'messages' => [
    //                         [
    //                             'role' => 'system',
    //                             'content' => $role,
    //                         ],
    //                         [
    //                             'role' => 'user',
    //                             'content' => $prompt,
    //                         ],
    //                     ],
    //                     'temperature' => 1,
    //                     'stream' => true,
    //                 ],
    //                 'stream' => true,
    //             ]);

    //             $buffer = '';
    //             $output = "";
    //             while (!$res->getBody()->eof()) {
    //                 $buffer .= $res->getBody()->read(1024);

    //                 while (($endOfJson = strpos($buffer, "\n")) !== false) {
    //                     $json = substr($buffer, 0, $endOfJson);
    //                     $buffer = substr($buffer, $endOfJson + 1);
    //                     $data = $json;

    //                     if ($data) {
    //                         $string = $this->responseDecode($data);
    //                         echo $string;
    //                     }
    //                 }
    //                 ob_flush();
    //                 flush();
    //             }
    //         });

    //         // Return the response
    //         return $response;
    //     } catch (\Exception $e) {
    //         Log::error("Exception: " . $e->getMessage());
    //         return response()->json(["message" => "Unexpected Error!"], 500);
    //     }
    // }