package firebase.auth;
@:jsRequire("firebase", "auth.RecaptchaVerifier") extern class RecaptchaVerifier implements firebase.auth.ApplicationVerifier {
	/**
		The application verifier type. For a reCAPTCHA verifier, this is 'recaptcha'.
	**/
	var type : String;
	/**
		Clears the reCAPTCHA widget from the page and destroys the current instance.
	**/
	function clear():Void;
	/**
		Renders the reCAPTCHA widget on the page.
	**/
	function render():js.Promise<Float>;
	/**
		Waits for the user to solve the reCAPTCHA and resolves with the reCAPTCHA
		token.
	**/
	function verify():js.Promise<String>;
}