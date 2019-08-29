package firebase.auth;
@:jsRequire("firebase", "auth.UserMetadata") extern interface UserMetadata {
	/**
		The date the user last signed in, formatted as a UTC string.
		For example, 'Fri, 22 Sep 2017 01:49:58 GMT'.
	**/
	var lastSignInTime : String;
	/**
		The date the user was created, formatted as a UTC string.
		For example, 'Fri, 22 Sep 2017 01:49:58 GMT'.
	**/
	var creationTime : String;
}