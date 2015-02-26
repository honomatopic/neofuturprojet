<?php

use Lib\Validation\UserLoginValidator as UserLoginValidator;

class AuthController extends BaseController {

    protected $login_validation;

	public function __construct(UserLoginValidator $login_validation)
	{
		parent::__construct();
		$this->login_validation = $login_validation;
	}

	public function getLogin()
	{
		return View::make('login');
	}

	public function postLogin()
	{
		if ($this->login_validation->fails()) {
		  return Redirect::to('auth/login')
		  ->withErrors($this->login_validation->errors())
		  ->withInput();
		} else {
			// $user = array(
				// 'nom' => Input::get('name'), 
				// 'motpasse' => Input::get('password')
			// );			
			$user = array(
				'nom' => 'Purpel',
				'motpasse' => '$2y$10$UwKM/y/PQ2.wPNI5JZ2yZ.6vMYHAz/INk7EgIbjgoA07Lafy629CC'
			);
			return Auth::attempt($user, Input::get('souvenir')) ? "ok " : " pas ok ";
			if(Auth::attempt($user, Input::get('souvenir'))) {
				return Redirect::intended('appli/liste');
			}
		    return Redirect::to('auth/login')
		    ->with('pass', 'Le mot de passe n\'est pas correct !')
		    ->withInput();
		}
	}

	public function getLogout()
	{
		Auth::logout();
		return Redirect::route('appli/liste');
	}

}