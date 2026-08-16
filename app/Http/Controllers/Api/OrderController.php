<?php

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::all();
        return response()->json(['success' => true, 'data' => $orders], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'total_amount' => 'required|numeric',
            'status'       => 'required|string',
        ]);

        $order = Order::create([
            'user_id'      => auth()->id(),
            'total_amount' => $request->total_amount,
            'status'       => $request->status,
        ]);

        return response()->json(['success' => true, 'message' => 'Order created successfully', 'data' => $order], 201);
    }

    public function show($id)
    {
        $order = Order::findOrFail($id);
        return response()->json(['success' => true, 'data' => $order], 200);
    }

    public function update(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->update($request->only(['total_amount', 'status']));

        return response()->json(['success' => true, 'message' => 'Order updated successfully', 'data' => $order], 200);
    }

    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        $order->delete();

        return response()->json(['success' => true, 'message' => 'Order deleted successfully'], 200);
    }
}