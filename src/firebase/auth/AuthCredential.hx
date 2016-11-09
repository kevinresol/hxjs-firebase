package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.AuthCredential") extern interface AuthCredential {
	/**
		The authentication provider ID for the credential.
		For example, 'facebook.com', or 'google.com'.
	**/
	var provider : String;
}