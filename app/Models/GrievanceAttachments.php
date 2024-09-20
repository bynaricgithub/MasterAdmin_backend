<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GrievanceAttachments extends Model
{
    use HasFactory;

    protected $table = 'grievanceAttachments';

    protected $guarded = [];

    public function grievance()
    {
        return $this->belongsTo(Grievance::class);
    }
}
