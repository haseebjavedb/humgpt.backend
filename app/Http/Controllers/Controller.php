<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function uploadImage($request, $image){
        if($request->hasFile($image)){
            $img = $request->file($image);
            $imgName = time() ."-". str_replace(" ", "_", $img->getClientOriginalName());
            $img->move(public_path('uploads'), $imgName);
            return $imgName;
        }else{
            return 'default.png';
        }
    }
}
