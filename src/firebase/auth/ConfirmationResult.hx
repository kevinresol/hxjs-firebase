package firebase.auth;
@:jsRequire("firebase", "auth.ConfirmationResult") extern interface ConfirmationResult {
	/**
		The phone number authentication operation's verification ID. This can be used
		along with the verification code to initialize a phone auth credential.
	**/
	var verificationId : String;
	/**
		Finishes a phone number sign-in, link, or reauthentication, given the code
		that was sent to the user's mobile device.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the verification code is not valid.</dd>
		<dt>auth/missing-verification-code</dt>
		<dd>Thrown if the verification code is missing.</dd>
		</dl>
	**/
	function confirm(verificationCode:String):js.Promise<firebase.auth.UserCredential>;
}