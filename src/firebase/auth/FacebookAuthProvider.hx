package firebase.auth;
@:jsRequire("firebase", "auth.FacebookAuthProvider") extern class FacebookAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	/**
		This corresponds to the sign-in method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	static var FACEBOOK_SIGN_IN_METHOD : String;
	static function credential(token:String):firebase.auth.OAuthCredential;
	var providerId : String;
	function addScope(scope:String):firebase.auth.AuthProvider;
	/**
		Sets the OAuth custom parameters to pass in a Facebook OAuth request for
		popup and redirect sign-in operations.
		Valid parameters include 'auth_type', 'display' and 'locale'.
		For a detailed list, check the
		{@link https://goo.gl/pve4fo Facebook}
		documentation.
		Reserved required OAuth 2.0 parameters such as 'client_id', 'redirect_uri',
		'scope', 'response_type' and 'state' are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):firebase.auth.AuthProvider;
}