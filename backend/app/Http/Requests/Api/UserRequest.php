<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        $id = $this->input('id');
        return [
            'fname'         => 'required',
            'lname'         => 'required',
            'email'         => 'required|email|unique:users,email,'.(($id) ? $id : null).',id',
            'password'      => 'sometimes|nullable|min:8',
            'mobile_number' => 'required'
        ];
    }
}
