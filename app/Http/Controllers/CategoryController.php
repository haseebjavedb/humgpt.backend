<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use Auth;

class CategoryController extends Controller
{
    public function save(Request $request){
        $request->validate([
            'name' => "required",
        ]);
        if($request->id){
            $category = Category::find($request->id);
        }else{
            $category = new Category();
            $category->user_id = Auth::user()->user_type == 0 ? Auth::id() : 0;
        }
        $category->name = $request->name;
        $category->save();

        return response()->json(["message" => "category saved successfully"], 200);
    }

    public function all(){
        $categories = Category::with('user')->get();
        return response()->json($categories, 200);
    }
    
    public function userAll(){
        $categories = Category::where('user_id', 0)->where('user_id', Auth::id())->get();
        return response()->json($categories, 200);
    }

    public function delete($id){
        Category::find($id)->delete();
        return response()->json(["message" => "category deleted successfully"], 200);
    }
}
