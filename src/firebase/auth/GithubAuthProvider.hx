package firebase.auth;
extern class GithubAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	static function credential(token:String):firebase.auth.AuthCredential;
	var providerId : String;
	function addScope(scope:String):Void;
	/**
		Sets the OAuth custom parameters to pass in a GitHub OAuth request for popup
		and redirect sign-in operations.
		Valid parameters include 'allow_signup'.
		For a detailed list, check the
		{@link https://developer.github.com/v3/oauth/ GitHub} documentation.
		Reserved required OAuth 2.0 parameters such as 'client_id', 'redirect_uri',
		'scope', 'response_type' and 'state' are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):Void;
}