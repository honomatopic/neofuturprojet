@extends('template')

@section('contenu')
  <div class="col-md-offset-1 col-md-10">
      <h1>Le projet Neofutur
  	@if(Auth::check())
  		<div class="btn-group pull-right">
	  		{{ link_to('appli/add', 'Télécharger une application, array('class' => 'btn btn-info')) }}
	  		{{ link_to('auth/logout', 'Deconnexion', array('class' => 'btn btn-warning')) }}
  		</div>
  	@else
  		{{ link_to('auth/login', 'Se connecter', array('class' => 'btn btn-info pull-right')) }}
  	@endif
  	</h1>
	  @foreach($applis as $appli)
	  	<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{{{ $appli->titre }}}</h3>
				</div>
				<div class="panel-body"> 
					<p>{{{ $appli->description }}}</p>
					@if(Auth::check() and Auth::user()->admin)
						{{ link_to('appli/del/' . $appli->id, 'Retirer cette application', array('class' => 'btn btn-danger btn-xs', 'onclick' => 'return confirm(\'Vraiment supprimer cette application ?\')')) }}
					@endif
					<em class="pull-right">
						Ecrit par {{{ $appli->user->name }}} le {{ $appli->created_at->format('d-m-Y') }}
					</em>
				</div>
			</div>
	  @endforeach
	  {{ $appli->links() }}
	</div>
@stop