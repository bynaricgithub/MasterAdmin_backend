<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grievance extends Model
{
    use HasFactory;
    protected $table = 'grievance';

    protected $guarded = [];

    public function attachments()
    {
        return $this->hasMany(GrievanceAttachments::class);
    }
}
