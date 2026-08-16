<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
   public function show(Request $request)
{
    return response()->json([
        'success' => true,
        'data' => $request->user()
    ]);
}

public function update(Request $request)
{
    

    $request->validate([
        'name'  => 'required|string|max:255',
        'email' => 'required|email|unique:users,email,' . $request->user()->id,
    ]);

    $user = $request->user();

    $user->update([
        'name'  => $request->name,
        'email' => $request->email,
    ]);

    return response()->json([
        'success' => true,
        'message' => 'Profile Updated Successfully',
        'data'    => $user
    ]);
}

public function changePassword(Request $request)
{
    $request->validate([
        'current_password' => 'required',
        'new_password' => 'required|min:8|confirmed',
    ]);

    $user = $request->user();

    if (!Hash::check($request->current_password, $user->password)) {
        return response()->json([
            'message' => 'Current password is incorrect'
        ], 400);
    }

    $user->password = Hash::make($request->new_password);
    $user->save();

    return response()->json([
        'message' => 'Password changed successfully'
    ]);
}


}
