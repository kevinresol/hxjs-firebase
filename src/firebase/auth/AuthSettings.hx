package firebase.auth;
@:jsRequire("firebase", "auth.AuthSettings") extern interface AuthSettings {
	/**
		When set, this property disables app verification for the purpose of testing
		phone authentication. For this property to take effect, it needs to be set
		before rendering a reCAPTCHA app verifier. When this is disabled, a
		mock reCAPTCHA is rendered instead. This is useful for manual testing during
		development or for automated integration tests.
		
		In order to use this feature, you will need to
		{@link https://firebase.google.com/docs/auth/web/phone-auth#test-with-whitelisted-phone-numbers
		whitelist your phone number} via the
		Firebase Console.
		
		The default value is false (app verification is enabled).
	**/
	var appVerificationDisabledForTesting : Bool;
}