<?php

namespace App\Models;

use App\Models\Course;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Question extends Model
{
    use HasFactory;

    protected $table = "questions";
    protected $guarded = [];
    protected $appends = ['option_display','option_array'];

    public function getOptionDisplayAttribute()
    {
        $json_options = $this->attributes['json_options'] ?? '';
        if($json_options) {
            $array = json_decode($json_options);
            $content = '';
            foreach ($array as $value) {
                $content .= $value.'<br>';
            }
            return $content;
        }

        return '';
    }

    public function getOptionArrayAttribute()
    {
        $json_options = $this->attributes['json_options'] ?? '';
        if($json_options) {
            return json_decode($json_options);
        }

        return '';
    }

    public function course()
    {
        return $this->belongsTo(Course::class, 'course_id');
    }
}
