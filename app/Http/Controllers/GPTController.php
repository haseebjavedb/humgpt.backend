<?php

namespace App\Http\Controllers;

use App\Models\GptInstruction;
use App\Models\GptRole;
use App\Models\PromptQuestion;
use App\Models\Chat;
use App\Models\Answer;
use App\Models\Message;
use App\Models\Prompt;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Illuminate\Support\Facades\Auth;
use carbon\Carbon;
use App\Models\User;

class GPTController extends Controller
{
    private $api_Key = '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';

    public function getIndexes($string, $character){
        $offset = 0;
        $indexes = [];
        while (($index = strpos($string, $character, $offset)) !== false) {
            $indexes[] = $index;
            $offset = $index + 1;
        }
        return $indexes;
    }

    public function responseDecode($string){
        $string = substr($string, 6);
        if($string !== "[DONE]"){
            $decodes = json_decode($string, true);
            // echo "<pre>";
            // print_r($decodes['choices'][0]['delta']['content']);
            if($decodes){
                if(isset($decodes['choices'][0]['delta']['content'])){
                    $output = $decodes['choices'][0]['delta']['content'];
                }else{
                    $output = "";
                }
            }else{
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

    // public function extractFromIndexes($string, $startIndex, $endIndex){
    //     if ($endIndex > $startIndex) {
    //         $length = $endIndex - $startIndex;
    //         $extractedText = substr($string, $startIndex, $length);
    //         return $extractedText;
    //     }else{
    //         return "";
    //     }
    // }
    function extractFromIndexes($string, $startIndex, $endIndex = null) {
        // If $endIndex is not provided, set it to the length of the string
        if ($endIndex === null) {
            $endIndex = strlen($string);
        }
    
        if ($endIndex > $startIndex) {
            $length = $endIndex - $startIndex;
            return substr($string, $startIndex, $length);
        } else {
            return "";
        }
    }    

    // public function filterString(){
    //     $string = "";
    //     $indexes = $this->getIndexes($string);
    // }

    public function testChat(Request $request){
        try {
            $chatid = "kVtp1-ysXk0-0l4lq-iZcsr";
            $userId = Auth::id();
            $chat = Chat::where('chatid', $chatid)->first();
            $answers = Answer::with('question')->where('chat_id', $chat->id)->get();
            $ques = [];
            $prompt_question_id = 0;
            foreach($answers as $answer){
                if(isset($answer->question)){
                    $prompt_question_id = $answer->question->prompt_question_id;
                    $ques[$answer->question->key] = $answer->answer;
                }
            }
            $prompt_obj = Prompt::where('prompt_question_id', $prompt_question_id)->first();
            $input = $prompt_obj->prompt;
            foreach($ques as $key => $value){
                $placeholderWithoutSpaces = '{' . $key . '}';
                $placeholderWithSpaces = '{ ' . $key . ' }';
                $input = str_replace($placeholderWithoutSpaces, $value, $input);
                $input = str_replace($placeholderWithSpaces, $value, $input);
            }
            $gpt_role = GptRole::where('prompt_question_id', $prompt_question_id)->first();
            $prompt = "";
            $role = "";

            if($gpt_role){
                $role = $gpt_role->role;
                // Fetch the GPT instructions associated with the GPT role
                $gpt_instructions = GptInstruction::where('gpt_role_id', $gpt_role->id)->get();
                
                // Initialize the prompt with the Instructions tag
                $prompt .= "<Instructions>";
                
                // Append each GPT instruction to the prompt
                foreach($gpt_instructions as $gpt_instruction){
                    $prompt .= "$gpt_instruction->instruction \n";
                }
                
                // Close the Instructions tag and append the user input
                $prompt .= "</Instructions>\n\n";
            }else{
                $role = "You are a helpful assistant";
            }
            
            $prompt .= $input;

            $client = new Client();

            // $msg = new Message();
            // $msg->user_id = $userId;
            // $msg->chat_id = $chat->id;
            // $msg->message = $prompt;
            // $msg->is_bot = 0;
            // $msg->is_hidden = 1;
            // $msg->is_included = 1;
            // $msg->save();

            // $message = "";

            // Create a new streamed response
            $response = new StreamedResponse(function() use ($client, $prompt, $role, &$chat, $userId) {
                $message = "";
                $orgMessage = "";
                // Make a POST request to the GPT API
                $res = $client->post('https://api.openai.com/v1/chat/completions', [
                    'headers' => [
                        'Authorization' => "Bearer " . $this->api_Key,
                        'Content-Type' => 'application/json',
                    ],
                    'json' => [
                        'model' => "gpt-4-1106-preview",
                        'messages' => [
                            [
                                'role' => 'system',
                                'content' => $role,
                            ],
                            [
                                'role' => 'user',
                                'content' => $prompt,
                            ],
                        ],
                        'temperature' => 1,
                        'stream' => true,
                    ],
                    'stream' => true,
                ]);
            
                // Read the response from the GPT API
                $buffer = '';
                $output = "";
                echo "<pre>";
                while (!$res->getBody()->eof()) {
                    
                    $buffer .= $res->getBody()->read(1024);
                    // echo "Original<br>";
                    // echo $buffer;
                    // echo "<br>Buffered<br>";
                    // Check if the buffer has a complete JSON object
                    while (($endOfJson = strpos($buffer, "\n")) !== false) {
                        $json = substr($buffer, 0, $endOfJson);
                        $buffer = substr($buffer, $endOfJson + 1);
                        $data = $json;
                        if($data){
                            $string = $this->responseDecode($data);
                            echo $string;
                        }
                    }
                    // echo $output;
                    // echo "End Buuffer<br>";
                    // dd($data);
                    // $data = $res->getBody()->read(1024);
                    // $orgMessage .= $data;
                    // $exploded = explode('ent":', $data);
                    // $string = "";
                    // for($i = 1; $i < count($exploded); $i++){
                    //     $indexes = $this->getIndexes($exploded[$i], '"');
                    //     if(strpos($exploded[$i], '\"') !== false){
                    //         $outString = $this->extractFromIndexes($exploded[$i], $indexes[0], $indexes[2]);
                    //     }else{
                    //         if(count($indexes) >= 2){
                    //             $outString = $this->extractFromIndexes($exploded[$i], $indexes[0], $indexes[1]);
                    //         }else{
                    //             $subExplaode = explode('"', $exploded[$i]);
                    //             if(isset($subExplaode[1])){
                    //                 $outString = $subExplaode[1];
                    //                 if (strrpos($subExplaode[1], "[DONE]") === (strlen($subExplaode[1]) - 6)) {
                    //                     $outString .= "[DONE]";
                    //                 }
                    //             }
                    //         }
                    //     }
                    //     if (!empty($outString)) {
                    //         $string .= substr($outString, 1);
                    //     }
                    // }
                    // Output the response
                    // $message .= $string;
                    // echo $string;
                    ob_flush();
                    flush();
                }
                // echo "<br>";
                // echo $orgMessage;
                // echo "<br>";
                // $chat->chat_message = $message;
                // $chat->save();
    
                // $msg = new Message();
                // $msg->user_id = $userId;
                // $msg->chat_id = $chat->id;
                // $msg->message = $message;
                // $msg->is_bot = 1;
                // $msg->is_hidden = 0;
                // $msg->is_included = 1;
                // $msg->save();
            });
            
            // Return the response
            return $response;
        } catch (\Exception $e) {
            return response()->json(["message" => "Unexpected Error! " . $e->getMessage()], 422);
        }
    }

    // This function is used to test the response from the GPT API
    public function testResponse(Request $request)
    {
        // dd("Something");
        // Get the input and prompt_id from the request
        $input = $request->input;
        $prompt_id = $request->prompt_id;
        // $input = "Write a blog on 'How to write SEO friendly blogs'. Use keywords like Don't and make important keywords wrapped with double quotes";
        // $prompt_id = 0;
        $role = "";
        // Fetch the GPT role associated with the prompt_id
        $gpt_role = GptRole::where('prompt_question_id', $prompt_id)->first();
        $prompt = "";

        if($gpt_role){
            $role = $gpt_role->role;
            // Fetch the GPT instructions associated with the GPT role
            $gpt_instructions = GptInstruction::where('gpt_role_id', $gpt_role->id)->get();
            
            // Initialize the prompt with the Instructions tag
            $prompt .= "<Instructions>";
            
            // Append each GPT instruction to the prompt
            foreach($gpt_instructions as $gpt_instruction){
                $prompt .= "$gpt_instruction->instruction \n";
            }
            
            // Close the Instructions tag and append the user input
            $prompt .= "</Instructions>\n\n";
        }else{
            $role = "You are a helpful assistant";
        }
        
        $prompt .= $input;
        
        // Initialize the Guzzle HTTP client
        $client = new Client();
        // echo "<pre>";
        // Create a new streamed response
        $response = new StreamedResponse(function() use ($client, $prompt, $role) {
            // Make a POST request to the GPT API
            $res = $client->post('https://api.openai.com/v1/chat/completions', [
                'headers' => [
                    'Authorization' => "Bearer " . $this->api_Key,
                    'Content-Type' => 'application/json',
                ],
                'json' => [
                    'model' => "gpt-4-1106-preview",
                    'messages' => [
                        [
                            'role' => 'system',
                            'content' => $role,
                        ],
                        [
                            'role' => 'user',
                            'content' => $prompt,
                        ],
                    ],
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
                    if($json){
                        $output = $this->responseDecode($json);
                        $string .= $output;
                    }
                }
                // Output the response
                echo $string;
                ob_flush();
                flush();
            }
        });
        // echo "Response Ended Here";
        // Return the response
        return $response;
    }

    public function firstResponse(Request $request){
        try {
            $chatid = $request->chatid;
            $userId = Auth::id();
            $chat = Chat::where('chatid', $chatid)->first();
            $user = User::find($userId);

            if (!$chat) {
                // Handle the case where chat is not found
                return response()->json(["message" => "Chat not found"], 404);
            }

            // Convert subscribed_date and expiration_date to Carbon instances
            $subscribedDate = Carbon::parse($user->subscribed_date);
            $expirationDate = Carbon::parse($user->expire_date);

            if(($user->no_words <= $user->used_words) || ($subscribedDate->gt($expirationDate))){
                return response()->json(['message'=> 'Your plan has expired. Kindly subscribe to continue using the service.','code' => 503], 503);
            }
    
          
    
            $answers = Answer::with('question')->where('chat_id', $chat->id)->get();
            $ques = [];
            $prompt_question_id = 0;
    
            foreach($answers as $answer) {
                if(isset($answer->question)){
                    $prompt_question_id = $answer->question->prompt_question_id;
                    $ques[$answer->question->key] = $answer->answer;
                }
            }
    
            $prompt_obj = Prompt::where('prompt_question_id', $prompt_question_id)->first();
            $input = $prompt_obj ? $prompt_obj->prompt : '';
    
            foreach($ques as $key => $value){
                $placeholderWithoutSpaces = '{' . $key . '}';
                $placeholderWithSpaces = '{ ' . $key . ' }';
                $input = str_replace($placeholderWithoutSpaces, $value, $input);
                $input = str_replace($placeholderWithSpaces, $value, $input);
            }
    
            $gpt_role = GptRole::where('prompt_question_id', $prompt_question_id)->first();
            $prompt = "";
            $role = "";
            if($gpt_role){
                $role = $gpt_role->role;
                // Fetch the GPT instructions associated with the GPT role
                $gpt_instructions = GptInstruction::where('gpt_role_id', $gpt_role->id)->get();
                
                // Initialize the prompt with the Instructions tag
                $prompt .= "<Instructions>";
                
                // Append each GPT instruction to the prompt
                foreach($gpt_instructions as $gpt_instruction){
                    $prompt .= "$gpt_instruction->instruction \n";
                }
                
                // Close the Instructions tag and append the user input
                $prompt .= "</Instructions>\n\n";
            }else{
                $role = "You are a helpful assistant";
            }
            
            $prompt .= $input;

            $client = new Client();

            $msg = new Message();
            $msg->user_id = $userId;
            $msg->chat_id = $chat->id;
            $msg->message = $prompt;
            $msg->is_bot = 0;
            $msg->is_hidden = 1;
            $msg->is_included = 1;
            $msg->save();

            // $message = "";

            // Create a new streamed response
            $response = new StreamedResponse(function() use ($client, $prompt, $role, &$chat, $userId) {
                $message = "";
                // Make a POST request to the GPT API
                $res = $client->post('https://api.openai.com/v1/chat/completions', [
                    'headers' => [
                        'Authorization' => "Bearer " . $this->api_Key,
                        'Content-Type' => 'application/json',
                    ],
                    'json' => [
                        'model' => "gpt-4-1106-preview",
                        'messages' => [
                            [
                                'role' => 'system',
                                'content' => $role,
                            ],
                            [
                                'role' => 'user',
                                'content' => $prompt,
                            ],
                        ],
                        'temperature' => 1,
                        'stream' => true,
                    ],
                    'stream' => true,
                ]);
                $buffer = '';
                // Read the response from the GPT API
                while (!$res->getBody()->eof()) {
                    $buffer .= $res->getBody()->read(1024);
                    $string = '';
                    while (($endOfJson = strpos($buffer, "\n")) !== false) {
                        $json = substr($buffer, 0, $endOfJson);
                        $buffer = substr($buffer, $endOfJson + 1);
                        $data = $json;
                        if($json){
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
                $chat->chat_message = $message;
                $chat->save();
    
                $msg = new Message();
                $msg->user_id = $userId;
                $msg->chat_id = $chat->id;
                $msg->message = $message;
                $msg->is_bot = 1;
                $msg->is_hidden = 0;
                $msg->is_included = 1;
                $msg->save();
            });
            
            // Return the response
            return $response;
        } catch (\Exception $e) {
            return response()->json(["message" => "Unexpected Error! " . $e->getMessage()], 422);
        }
    }

    
    public function gptResponse(Request $request){
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

            if(($user->no_words <= $user->used_words) || ($subscribedDate->gt($expirationDate))){
                return response()->json(['message'=> 'Your plan has expired. Kindly subscribe to continue using the service.','code' => 503], 503);
            }

        $messages = Message::where('chat_id', $chat->id)->get();
        $history = [];
        foreach($messages as $message){
            if($message->is_bot == 1){
                $role = "system";
            }else{
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
        if($gpt_role){
            $role = $gpt_role->role;
        }else{
            $role = "You are a helpful assistant";
        }
        $client = new Client();
        $prompt = $input;
        $response = new StreamedResponse(function() use ($client, $prompt, $role, &$chat, $userId, $history) {
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
                    if($json){
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
}
