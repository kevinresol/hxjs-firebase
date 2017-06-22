package firebase.auth;
@:jsRequire("firebase", "auth.ApplicationVerifier") extern interface ApplicationVerifier {
	/**
		Identifies the type of application verifier (e.g. "recaptcha").
	**/
	var type : String;
	/**
		Executes the verification process.
	**/
	function verify():js.Promise<String>;
}