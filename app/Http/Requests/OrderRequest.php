<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
{
    return true; // ← Must be true
}

public function rules(): array
{
    return [
        'total_amount' => 'required|numeric',
        'status'       => 'nullable|string',
    ];
}
}
