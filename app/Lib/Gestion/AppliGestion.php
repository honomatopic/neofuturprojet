<?php namespace Lib\Gestion;

use Post;
use Input;
use Auth;

class AppliGestion {

    public function liste($n)
	{
		$appli = Appli::with('user')
		->orderBy('appli.created_at', 'desc')
		->paginate(4);
		return compact('appli');
	}

	public function save()
	{
		Appli::create(array(
			'nom' => Input::get('nom'),
			'description' => Input::get('description'),
			'user_id' => Auth::user()->id
		));
	}

	public function del($id)
	{
		Post::find($id)->delete();
	}

}