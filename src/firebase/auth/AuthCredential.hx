package firebase.auth;
extern interface AuthCredential {
	/**
		The authentication provider ID for the credential.
		For example, 'facebook.com', or 'google.com'.
	**/
	var provider : String;
}