<!DOCTYPE html>
<html lang="fr-FR">
    <head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Réinitialisation du mot de passe</h2>

		<div>
			Pour réinitialiser votre mot de passe {{ link_to('password/reset/' . $token, 'cliquez sur ce lien') }}.
		</div>
	</body>
</html>