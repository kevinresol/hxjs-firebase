package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.GoogleAuthProvider") extern class GoogleAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	/**
		Creates a credential for Google. At least one of ID token and access token
		is required.
	**/
	static function credential(?idToken:String, ?accessToken:String):firebase.auth.AuthCredential;
	var providerId : String;
	function addScope(scope:String):Void;
	/**
		Sets the OAuth custom parameters to pass in a Google OAuth request for popup
		and redirect sign-in operations.
		Valid parameters include 'hd', 'hl', 'include_granted_scopes', 'login_hint'
		and 'prompt'.
		For a detailed list, check the
		{@link https://goo.gl/Xo01Jm Google}
		documentation.
		Reserved required OAuth 2.0 parameters such as 'client_id', 'redirect_uri',
		'scope', 'response_type' and 'state' are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):Void;
}