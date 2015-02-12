<?php
class Appli extends Eloquent {

    protected $fillable = array('nom','description','user_id');
	public $timestamps = true;

	public function user() 
	{
		return $this->belongsTo('User');
	}

}