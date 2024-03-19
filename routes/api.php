<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PromptQuestionController;
use App\Http\Controllers\PromptController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\PromptVersionController;
use App\Http\Controllers\GPTController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\GptRoleController;
use App\Http\Controllers\GptInstructionController;
use App\Http\Controllers\AnswerController;
use App\Http\Controllers\ButtonController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\PricingPlanController;
use App\Http\Controllers\StripeController;

// Route::get('chat-response', [GPTController::class, "fetchResponse"]);

// Auth Routes
Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('verify-email', [AuthController::class, 'verifyEmail']);
    Route::post('resend-email', [AuthController::class, 'resendEmail']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('forgot-password', [AuthController::class, 'forgotPassword']);
    Route::post('verify-forgot-password-email', [AuthController::class, 'verifyForgotEmail']);
    Route::post('recover-password', [AuthController::class, 'recoverPassword']);
    Route::get('redirect', [UserController::class, 'redirectToProvider']);
        
  // Route to redirect users to the Google OAuth page
Route::get('google', [AuthController::class, 'redirectToGoogle'])->name('auth.google');

// Route for Google to callback after user has authenticated
Route::get('google/callback', [AuthController::class, 'handleGoogleCallback']);

// Assuming you want to add a POST route for handling the token from the frontend
Route::post('google/token', [AuthController::class, 'handleGoogleToken']);
// routes/api.php
Route::post('google-login', [AuthController::class, 'googleLogin']);


});

// Category Routes
Route::prefix('category')->group(function () {
    // Route::post('save', [CategoryController::class, 'save']);
    Route::get('all', [CategoryController::class, 'all']);
    // Route::get('delete/{id}', [CategoryController::class, 'delete']);
});

// Route::get('test', [GPTController::class, 'gptResponse']);
// Route::prefix('question')->group(function () {
//     Route::get('all/prompt/{prompt_id}/{order?}', [QuestionController::class, 'allPrompQuestions']);
// });

Route::get('all-prompts', [PromptQuestionController::class, 'homePagePrompts']);

// Authenticated Routes
Route::middleware('auth:sanctum')->group(function () {
    // Category Routes
    Route::prefix('category')->group(function () {
        Route::post('save', [CategoryController::class, 'save']);
        Route::get('delete/{id}', [CategoryController::class, 'delete']);
    });
    // Prompt Routes
    Route::prefix('prompt')->group(function () {
        Route::post('save-prompt', [PromptQuestionController::class, 'savePrompt']);
        Route::get('all-prompts', [PromptQuestionController::class, 'allPrompts']);
        Route::get('system-prompts', [PromptQuestionController::class, 'systemPrompts']);
        Route::get('templates-library', [PromptQuestionController::class, 'library']);
        Route::get('my-templates-library', [PromptQuestionController::class, 'myLibrary']);
        Route::get('status/{id}/{status}', [PromptQuestionController::class, 'updateStatus']);
        Route::get('user-prompts', [PromptQuestionController::class, 'userPrompts']);
        Route::get('single/{id}', [PromptQuestionController::class, 'singlePrompt']);
        Route::get('delete/{id}', [PromptQuestionController::class, 'deletePrompt']);

        Route::post('save', [PromptController::class, 'savePrompt']);
        Route::get('get/{id}', [PromptController::class, 'getPrompt']);
        Route::get('find/{id}', [PromptController::class, 'findPrompt']);
        Route::get('publish/{id}', [PromptController::class, 'publishPrompt']);
        // Version Routes
        Route::get('restore-version/{version_id}', [PromptVersionController::class, 'restoreVersion']);
    });
    // Questions Routes
    Route::prefix('question')->group(function () {
        Route::post('save', [QuestionController::class, 'saveQuestion']);
        Route::get('single/{id}', [QuestionController::class, 'singleQuestion']);
        Route::get('delete/{id}', [QuestionController::class, 'deleteQuestion']);
        Route::get('all', [QuestionController::class, 'allQuestions']);
        Route::post('update-order', [QuestionController::class, 'updateOrder']);
        Route::get('all/prompt/{prompt_id}/{order?}', [QuestionController::class, 'allPrompQuestions']);
    });
    // GPT Routes
    Route::prefix('gpt')->group(function () {
        Route::post('test', [GPTController::class, 'testResponse']);
    });

    // Gpt Roles & Instructions
    Route::prefix('gpt-role')->group(function () {
        Route::post('save', [GptRoleController::class, 'saveRole']);
        Route::get('all', [GptRoleController::class, 'allRoles']);
        Route::get('user', [GptRoleController::class, 'userRoles']);
        Route::get('single/{id}', [GptRoleController::class, 'single']);
        Route::get('delete/{id}', [GptRoleController::class, 'delete']);
    });
    Route::prefix('button')->group(function () {
        Route::post('save', [ButtonController::class, 'saveButton']);
        Route::get('single/{id}', [ButtonController::class, 'singleButton']);
        Route::get('all', [ButtonController::class, 'allButtons']);
        Route::get('user', [ButtonController::class, 'userButtons']);
        Route::get('prompt/{prompt_question_id}', [ButtonController::class, 'promptButtons']);
        Route::get('delete/{id}', [ButtonController::class, 'deleteButton']);
    });
    Route::prefix('gpt-instructions')->group(function () {
        Route::post('save', [GptInstructionController::class, 'saveInstruction']);
        Route::get('delete/{id}', [GptInstructionController::class, 'delete']);
    });
    Route::prefix('answer')->group(function () {
        Route::post('save', [AnswerController::class, 'saveAnswers']);
    });
    Route::prefix('chat')->group(function () {
        Route::get('all', [ChatController::class, 'allChats']);
        Route::get('get/{chatid}', [ChatController::class, 'getChatfromid']);
    });
    Route::prefix('bot')->group(function () {
        Route::post('init-response', [GPTController::class, 'firstResponse']);
        Route::post('response', [GPTController::class, 'gptResponse']);
    });
    Route::prefix('user')->group(function () {
        Route::get('stats', [UserController::class, 'dashboardStats']);
        Route::post('upload-document', [DocumentController::class, 'uploadDocument']);
        Route::post('uploadDoc', [DocumentController::class, 'uploadDoc']);
        Route::post('uploadDoc2', [DocumentController::class, 'uploadDoc2']);
        Route::get('getChatHistory/{user_id}', [DocumentController::class, 'getChatHistory']);
        Route::get('singlechat2/{chatid}', [DocumentController::class, 'singleChat2']);
        Route::post('responseDecode', [DocumentController::class, 'responseDecode']);
        Route::get('all', [UserController::class, 'allUsers']);
        Route::get('info/{id}', [UserController::class, 'userInfo']);
        Route::post('update-picture', [UserController::class, 'updatePicture']);
        Route::post('update-password', [UserController::class, 'updatePassword']);
        Route::post('Delete/{id}', [UserController::class, 'Delete']);
        Route::post('Plans/{id}', [UserController::class, 'Plans']);
        Route::get('getplans/{id}', [UserController::class, 'getplans']);   
        Route::get('users/{id}', [UserController::class, 'index']);
          

        
    });
    Route::prefix('admin')->group(function () {
        Route::get('get', [AdminController::class, 'dashboardInfo']);
        Route::get('chat/all', [AdminController::class, 'allChats']);
        Route::get('chat/user/{user_id}', [AdminController::class, 'singleChat']);
    });
    Route::prefix('plans')->group(function () {
        Route::post('save', [PricingPlanController::class, 'savePlan']);
        Route::get('all', [PricingPlanController::class, 'allPlans']);
        Route::get('single/{id}', [PricingPlanController::class, 'getPlan']);
        Route::get('delete/{id}', [PricingPlanController::class, 'deletePlan']);
        Route::post('feature/save', [PricingPlanController::class, 'saveFeature']);
        Route::get('feature/delete/{id}', [PricingPlanController::class, 'deleteFeature']);
    });
    Route::prefix('stripe')->group(function () {
        Route::get('products', [StripeController::class, 'allProducts']);
        Route::get('single/{product_id}', [StripeController::class, 'singleProduct']);
        Route::post('process-payment', [StripeController::class, 'processPayment']);
        Route::post('process-payment2', [StripeController::class, 'processPayment2']);

    });
});
