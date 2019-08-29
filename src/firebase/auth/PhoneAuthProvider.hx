package firebase.auth;
@:jsRequire("firebase", "auth.PhoneAuthProvider") extern class PhoneAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	/**
		This corresponds to the sign-in method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	static var PHONE_SIGN_IN_METHOD : String;
	/**
		Creates a phone auth credential, given the verification ID from
		{@link firebase.auth.PhoneAuthProvider#verifyPhoneNumber} and the code
		that was sent to the user's mobile device.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/missing-verification-code</dt>
		<dd>Thrown if the verification code is missing.</dd>
		<dt>auth/missing-verification-id</dt>
		<dd>Thrown if the verification ID is missing.</dd>
		</dl>
	**/
	static function credential(verificationId:String, verificationCode:String):firebase.auth.AuthCredential;
	var providerId : String;
	/**
		Starts a phone number authentication flow by sending a verification code to
		the given phone number. Returns an ID that can be passed to
		{@link firebase.auth.PhoneAuthProvider#credential} to identify this flow.
		
		For abuse prevention, this method also requires a
		{@link firebase.auth.ApplicationVerifier}. The Firebase Auth SDK includes
		a reCAPTCHA-based implementation, {@link firebase.auth.RecaptchaVerifier}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/captcha-check-failed</dt>
		<dd>Thrown if the reCAPTCHA response token was invalid, expired, or if
		    this method was called from a non-whitelisted domain.</dd>
		<dt>auth/invalid-phone-number</dt>
		<dd>Thrown if the phone number has an invalid format.</dd>
		<dt>auth/missing-phone-number</dt>
		<dd>Thrown if the phone number is missing.</dd>
		<dt>auth/quota-exceeded</dt>
		<dd>Thrown if the SMS quota for the Firebase project has been exceeded.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given phone number has been
		    disabled.</dd>
		</dl>
	**/
	function verifyPhoneNumber(phoneNumber:String, applicationVerifier:firebase.auth.ApplicationVerifier):js.Promise<String>;
}