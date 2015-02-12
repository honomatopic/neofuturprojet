<?php namespace Lib\Validation;

class AppliValidator extends BaseValidator {

    public function __construct()
	{
		$this->regles = array(
			'titre' => 'required|max:80',
			'contenu' => 'required'
		);
	}

}