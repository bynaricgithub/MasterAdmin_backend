<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HomeMenu extends Model
{
    protected $table = 'homemenu';

    protected $fillable = ['label', 'url', 'parent_id', 'order', 'status'];

    // Relationship to get child menu items with ordering
    public function children()
    {
        return $this->hasMany(HomeMenu::class, 'parent_id')->orderBy('order');
    }

    // Relationship to get parent menu item
    public function parent()
    {
        return $this->belongsTo(HomeMenu::class, 'parent_id');
    }
}
