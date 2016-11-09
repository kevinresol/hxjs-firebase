package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.Error") extern interface Error {
	/**
		Unique error code.
	**/
	var code : String;
	/**
		Complete error message.
	**/
	var message : String;
}