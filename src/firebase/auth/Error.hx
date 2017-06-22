package firebase.auth;
@:jsRequire("firebase", "auth.Error") extern interface Error {
	/**
		Unique error code.
	**/
	var code : String;
	/**
		Complete error message.
	**/
	var message : String;
}