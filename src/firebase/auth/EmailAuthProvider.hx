package firebase.auth;
@:jsRequire("firebase", "auth.EmailAuthProvider") extern class EmailAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	/**
		This corresponds to the sign-in method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	static var EMAIL_PASSWORD_SIGN_IN_METHOD : String;
	/**
		This corresponds to the sign-in method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	static var EMAIL_LINK_SIGN_IN_METHOD : String;
	static function credential(email:String, password:String):firebase.auth.AuthCredential;
	/**
		Initialize an `EmailAuthProvider` credential using an email and an email link
		after a sign in with email link operation.
	**/
	static function credentialWithLink(email:String, emailLink:String):firebase.auth.AuthCredential;
	var providerId : String;
}