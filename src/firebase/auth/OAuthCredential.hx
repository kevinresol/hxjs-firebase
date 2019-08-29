package firebase.auth;
@:jsRequire("firebase", "auth.OAuthCredential") extern interface OAuthCredential extends firebase.auth.AuthCredential {
	/**
		The OAuth ID token associated with the credential if it belongs to an
		OIDC provider, such as `google.com`.
	**/
	var idToken : String;
	/**
		The OAuth access token associated with the credential if it belongs to an
		OAuth provider, such as `facebook.com`, `twitter.com`, etc.
	**/
	var accessToken : String;
	/**
		The OAuth access token secret associated with the credential if it belongs
		to an OAuth 1.0 provider, such as `twitter.com`.
	**/
	var secret : String;
	/**
		The authentication provider ID for the credential.
		For example, 'facebook.com', or 'google.com'.
	**/
	var providerId : String;
	/**
		The authentication sign in method for the credential.
		For example, 'password', or 'emailLink. This corresponds to the sign-in
		method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	var signInMethod : String;
	/**
		Returns a JSON-serializable representation of this object.
	**/
	function toJSON():Dynamic;
}