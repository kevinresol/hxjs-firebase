package firebase.auth;
@:jsRequire("firebase", "auth.ActionCodeInfo") extern interface ActionCodeInfo {
	/**
		The email address associated with the action code.
	**/
	var data : { var email : String; };
}