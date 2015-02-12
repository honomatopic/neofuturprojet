<?php namespace Lib\Gestion;

use User;
use Input;
use Hash;

class UserGestion implements UserGestionInterface {

    private function save($user)
	{
		$user->name = Input::get('name');
		$user->email = Input::get('email');		
		$user->admin = Input::get('admin') ? 1 : 0;
		$user->save();
	}

	public function index($n)
	{
		$users = User::paginate($n);
		return compact('users');
	}

	public function store()
	{
		$user = new User;		
		$user->password = Hash::make(Input::get('password'));
		$this->save($user);
	}

	public function show($id)
	{
		$user = User::find($id);
		return compact('user');
	}

	public function edit($id)
	{
		$user = User::find($id);
		return compact('user');
	}

	public function update($id)
	{
		$user = User::find($id);
		$this->save($user);
	}

	public function destroy($id)
	{
		User::find($id)->delete();
	}

}