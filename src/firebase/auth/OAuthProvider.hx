package firebase.auth;
@:jsRequire("firebase", "auth.OAuthProvider") extern class OAuthProvider implements firebase.auth.AuthProvider {
	/**
		Creates a Firebase credential from a generic OAuth provider's access token or
		ID token.
	**/
	function credential(?idToken:String, ?accessToken:String):firebase.auth.OAuthCredential;
	var providerId : String;
	function addScope(scope:String):firebase.auth.OAuthProvider;
	/**
		Sets the OAuth custom parameters to pass in an OAuth request for popup
		and redirect sign-in operations.
		For a detailed list, check the
		reserved required OAuth 2.0 parameters such as `client_id`, `redirect_uri`,
		`scope`, `response_type` and `state` are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):firebase.auth.OAuthProvider;
}