<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuestionRequest extends FormRequest
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
        return [
            'question'      => 'required',
            'category'      => 'required',
            'course_id'     => 'required',
            'answer'        => 'required'
        ];
    }

    public function messages()
    {
        return [
            'course_id'     => 'The course field is required.'
        ];
    }
}
