<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserExam extends Model
{
    use HasFactory;

    protected $table = "user_exams";
    protected $guarded = [];
    protected $appends = ['total', 'total_result', 'exam_status'];

    public function getTotalAttribute()
    {
        $course_id  = $this->attributes['course_id'] ?? '';
        $category   = $this->attributes['category'] ?? '';
        if($course_id && $category) {
            return Question::where('course_id', $course_id)->where('category', $category)->count();
        }

        return 0;
    }

    public function getTotalResultAttribute()
    {
        return $this->where('status', 'Correct')->count();
    }

    public function getExamStatusAttribute()
    {
        $result = $this->total_result;
        $total  = $this->total;

        if(($result / $total) * 100 >= 75) {
            return 'Passed';
        }

        return 'Failed';
    }
}
