package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.ActionCodeInfo") extern interface ActionCodeInfo {
	/**
		The email address associated with the action code.
	**/
	var data : { var email : String; };
}