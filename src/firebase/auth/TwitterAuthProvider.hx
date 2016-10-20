package firebase.auth;
@:jsRequire("firebase.auth", "TwitterAuthProvider") extern class TwitterAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	static function credential(token:String, secret:String):firebase.auth.AuthCredential;
	var providerId : String;
	/**
		Sets the OAuth custom parameters to pass in a Twitter OAuth request for popup
		and redirect sign-in operations.
		Valid parameters include 'lang'.
		Reserved required OAuth 1.0 parameters such as 'oauth_consumer_key',
		'oauth_token', 'oauth_signature', etc are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):Void;
}