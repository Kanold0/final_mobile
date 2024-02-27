<?php

namespace App\Http\Controllers;

use App\Models\FoodItem;
use Illuminate\Http\Request;

class FoodItemController extends Controller
{
    public function index()
    {
        return FoodItem::all();
    }

    public function store(Request $request)
    {
        return FoodItem::create($request->all());
    }

    public function show($id)
    {
        return FoodItem::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $foodItem = FoodItem::findOrFail($id);
        $foodItem->update($request->all());
        return $foodItem;
    }

    public function destroy($id)
    {
        $foodItem = FoodItem::findOrFail($id);
        $foodItem->delete();
        return response()->json(['message' => 'Food item deleted successfully']);
    }
}
