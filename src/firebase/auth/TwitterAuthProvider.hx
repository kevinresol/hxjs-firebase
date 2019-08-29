package firebase.auth;
@:jsRequire("firebase", "auth.TwitterAuthProvider") extern class TwitterAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	/**
		This corresponds to the sign-in method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	static var TWITTER_SIGN_IN_METHOD : String;
	static function credential(token:String, secret:String):firebase.auth.OAuthCredential;
	var providerId : String;
	/**
		Sets the OAuth custom parameters to pass in a Twitter OAuth request for popup
		and redirect sign-in operations.
		Valid parameters include 'lang'.
		Reserved required OAuth 1.0 parameters such as 'oauth_consumer_key',
		'oauth_token', 'oauth_signature', etc are not allowed and will be ignored.
	**/
	function setCustomParameters(customOAuthParameters:Dynamic):firebase.auth.AuthProvider;
}