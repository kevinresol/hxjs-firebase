package firebase.auth;
@:jsRequire("firebase.auth", "AuthCredential") extern interface AuthCredential {
	/**
		The authentication provider ID for the credential.
		For example, 'facebook.com', or 'google.com'.
	**/
	var provider : String;
}