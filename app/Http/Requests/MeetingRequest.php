<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MeetingRequest extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'type' => 'required|in:daily_standup,sprint_planning,sprint_review,sprint_retrospective',
            'duration' => 'required|integer|min:15|max:480',
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
        ];
    }

    public function messages(): array
    {
        return [
            'title.required' => 'Le titre de la réunion est obligatoire.',
            'title.max' => 'Le titre ne peut pas dépasser 255 caractères.',
            'type.required' => 'Le type de réunion est obligatoire.',
            'type.in' => 'Le type de réunion doit être: daily_standup, sprint_planning, sprint_review, sprint_retrospective ou backlog_refinement.',
            'duration.required' => 'La durée de la réunion est obligatoire.',
            'duration.integer' => 'La durée doit être un nombre entier.',
            'duration.min' => 'La durée minimum est de 15 minutes.',
            'duration.max' => 'La durée maximum est de 480 minutes (8 heures).',
            'user_id.required' => 'L\'organisateur de la réunion est obligatoire.',
            'user_id.exists' => 'L\'utilisateur sélectionné n\'existe pas.',
            'project_id.required' => 'Le projet associé à la réunion est obligatoire.',
            'project_id.exists' => 'Le projet sélectionné n\'existe pas.',
        ];
    }

}
