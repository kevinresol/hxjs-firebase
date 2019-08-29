package firebase;
@:jsRequire("firebase", "User") extern interface User extends firebase.UserInfo {
	/**
		The phone number normalized based on the E.164 standard (e.g. +16505550101)
		for the current user. This is null if the user has no phone credential linked
		to the account.
	**/
	var phoneNumber : String;
	var isAnonymous : Bool;
	/**
		True if the user's email address has been verified.
	**/
	var emailVerified : Bool;
	/**
		Additional metadata about the user.
	**/
	var metadata : firebase.auth.UserMetadata;
	/**
		Additional provider-specific information about the user.
	**/
	var providerData : Array<firebase.UserInfo>;
	/**
		A refresh token for the user account. Use only for advanced scenarios that
		require explicitly refreshing tokens.
	**/
	var refreshToken : String;
	/**
		Returns a JWT token used to identify the user to a Firebase service.
		
		Returns the current token if it has not expired, otherwise this will
		refresh the token and return a new one.
	**/
	function getIdToken(?forceRefresh:Bool):js.Promise<String>;
	/**
		Refreshes the current user, if signed in.
	**/
	function reload():js.Promise<Dynamic>;
	/**
		Sends a verification email to a user.
		
		The verification process is completed by calling
		{@link firebase.auth.Auth#applyActionCode}
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/missing-android-pkg-name</dt>
		<dd>An Android package name must be provided if the Android app is required
		    to be installed.</dd>
		<dt>auth/missing-continue-uri</dt>
		<dd>A continue URL must be provided in the request.</dd>
		<dt>auth/missing-ios-bundle-id</dt>
		<dd>An iOS bundle ID must be provided if an App Store ID is provided.</dd>
		<dt>auth/invalid-continue-uri</dt>
		<dd>The continue URL provided in the request is invalid.</dd>
		<dt>auth/unauthorized-continue-uri</dt>
		<dd>The domain of the continue URL is not whitelisted. Whitelist
		    the domain in the Firebase console.</dd>
		</dl>
	**/
	function sendEmailVerification(?actionCodeSettings:firebase.auth.ActionCodeSettings):js.Promise<Dynamic>;
	/**
		Links the user account with the given credentials.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/provider-already-linked</dt>
		<dd>Thrown if the provider has already been linked to the user. This error is
		    thrown even if this is not the same provider's account that is currently
		    linked to the user.</dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the provider's credential is not valid. This can happen if it
		    has already expired when calling link, or if it used invalid token(s).
		    See the Firebase documentation for your provider, and make sure you pass
		    in the correct parameters to the credential method.</dd>
		<dt>auth/credential-already-in-use</dt>
		<dd>Thrown if the account corresponding to the credential already exists
		    among your users, or is already linked to a Firebase User.
		    For example, this error could be thrown if you are upgrading an anonymous
		    user to a Google user by linking a Google credential to it and the Google
		    credential used is already associated with an existing Firebase Google
		    user.
		    The fields <code>error.email</code>, <code>error.phoneNumber</code>, and
		    <code>error.credential</code> ({@link firebase.auth.AuthCredential})
		    may be provided, depending on the type of credential. You can recover
		    from this error by signing in with <code>error.credential</code> directly
		    via {@link firebase.auth.Auth#signInWithCredential}.</dd>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if the email corresponding to the credential already exists
		    among your users. When thrown while linking a credential to an existing
		    user, an <code>error.email</code> and <code>error.credential</code>
		    ({@link firebase.auth.AuthCredential}) fields are also provided.
		    You have to link the credential to the existing user with that email if
		    you wish to continue signing in with that credential. To do so, call
		    {@link firebase.auth.Auth#fetchSignInMethodsForEmail}, sign in to
		    <code>error.email</code> via one of the providers returned and then
		    {@link firebase.User#linkWithCredential} the original credential to that
		    newly signed in user.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or
		    when the user associated with the email does not have a password.</dd>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential} and the verification
		    code of the credential is not valid.</dd>
		<dt>auth/invalid-verification-id</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential}  and the verification
		    ID of the credential is not valid.</dd>
		</dl>
	**/
	function linkWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Links the user account with the given credentials, and returns any available
		additional user information, such as user name.
		
		This method is deprecated. Use
		{@link firebase.User#linkWithCredential} instead.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/provider-already-linked</dt>
		<dd>Thrown if the provider has already been linked to the user. This error is
		    thrown even if this is not the same provider's account that is currently
		    linked to the user.</dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the provider's credential is not valid. This can happen if it
		    has already expired when calling link, or if it used invalid token(s).
		    See the Firebase documentation for your provider, and make sure you pass
		    in the correct parameters to the credential method.</dd>
		<dt>auth/credential-already-in-use</dt>
		<dd>Thrown if the account corresponding to the credential already exists
		    among your users, or is already linked to a Firebase User.
		    For example, this error could be thrown if you are upgrading an anonymous
		    user to a Google user by linking a Google credential to it and the Google
		    credential used is already associated with an existing Firebase Google
		    user.
		    The fields <code>error.email</code>, <code>error.phoneNumber</code>, and
		    <code>error.credential</code> ({@link firebase.auth.AuthCredential})
		    may be provided, depending on the type of credential. You can recover
		    from this error by signing in with <code>error.credential</code> directly
		    via {@link firebase.auth.Auth#signInWithCredential}.</dd>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if the email corresponding to the credential already exists
		    among your users. When thrown while linking a credential to an existing
		    user, an <code>error.email</code> and <code>error.credential</code>
		    ({@link firebase.auth.AuthCredential}) fields are also provided.
		    You have to link the credential to the existing user with that email if
		    you wish to continue signing in with that credential. To do so, call
		    {@link firebase.auth.Auth#fetchSignInMethodsForEmail}, sign in to
		    <code>error.email</code> via one of the providers returned and then
		    {@link firebase.User#linkWithCredential} the original credential to that
		    newly signed in user.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or
		    when the user associated with the email does not have a password.</dd>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential} and the verification
		    code of the credential is not valid.</dd>
		<dt>auth/invalid-verification-id</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential}  and the verification
		    ID of the credential is not valid.</dd>
		</dl>
	**/
	function linkAndRetrieveDataWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Links the user account with the given phone number.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/provider-already-linked</dt>
		<dd>Thrown if the provider has already been linked to the user. This error is
		    thrown even if this is not the same provider's account that is currently
		    linked to the user.</dd>
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
		<dt>auth/credential-already-in-use</dt>
		<dd>Thrown if the account corresponding to the phone number already exists
		    among your users, or is already linked to a Firebase User.
		    The fields <code>error.phoneNumber</code> and
		    <code>error.credential</code> ({@link firebase.auth.AuthCredential})
		    are provided in this case. You can recover from this error by signing in
		    with that credential directly via
		    {@link firebase.auth.Auth#signInWithCredential}.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the phone authentication provider in the
		    Firebase Console. Go to the Firebase Console for your project, in the
		    Auth section and the <strong>Sign in Method</strong> tab and configure
		    the provider.</dd>
		</dl>
	**/
	function linkWithPhoneNumber(phoneNumber:String, applicationVerifier:firebase.auth.ApplicationVerifier):js.Promise<firebase.auth.ConfirmationResult>;
	/**
		Unlinks a provider from a user account.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/no-such-provider</dt>
		<dd>Thrown if the user does not have this provider linked or when the
		    provider ID given does not exist.</dd>
		</dt>
	**/
	function unlink(providerId:String):js.Promise<firebase.User>;
	/**
		Re-authenticates a user using a fresh credential. Use before operations
		such as {@link firebase.User#updatePassword} that require tokens from recent
		sign-in attempts.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/user-mismatch</dt>
		<dd>Thrown if the credential given does not correspond to the user.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if the credential given does not correspond to any existing user.
		    </dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the provider's credential is not valid. This can happen if it
		    has already expired when calling link, or if it used invalid token(s).
		    See the Firebase documentation for your provider, and make sure you pass
		    in the correct parameters to the credential method.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or when
		    the user associated with the email does not have a password.</dd>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential} and the verification
		    code of the credential is not valid.</dd>
		<dt>auth/invalid-verification-id</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential}  and the verification
		    ID of the credential is not valid.</dd>
		</dl>
	**/
	function reauthenticateWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Re-authenticates a user using a fresh credential, and returns any available
		additional user information, such as user name. Use before operations
		such as {@link firebase.User#updatePassword} that require tokens from recent
		sign-in attempts.
		
		This method is deprecated. Use
		{@link firebase.User#reauthenticateWithCredential} instead.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/user-mismatch</dt>
		<dd>Thrown if the credential given does not correspond to the user.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if the credential given does not correspond to any existing user.
		    </dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the provider's credential is not valid. This can happen if it
		    has already expired when calling link, or if it used invalid token(s).
		    See the Firebase documentation for your provider, and make sure you pass
		    in the correct parameters to the credential method.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or when
		    the user associated with the email does not have a password.</dd>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential} and the verification
		    code of the credential is not valid.</dd>
		<dt>auth/invalid-verification-id</dt>
		<dd>Thrown if the credential is a
		    {@link firebase.auth.PhoneAuthProvider#credential}  and the verification
		    ID of the credential is not valid.</dd>
		</dl>
	**/
	function reauthenticateAndRetrieveDataWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Re-authenticates a user using a fresh credential. Use before operations
		such as {@link firebase.User#updatePassword} that require tokens from recent
		sign-in attempts.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/user-mismatch</dt>
		<dd>Thrown if the credential given does not correspond to the user.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if the credential given does not correspond to any existing user.
		    </dd>
		<dt>auth/captcha-check-failed</dt>
		<dd>Thrown if the reCAPTCHA response token was invalid, expired, or if
		    this method was called from a non-whitelisted domain.</dd>
		<dt>auth/invalid-phone-number</dt>
		<dd>Thrown if the phone number has an invalid format.</dd>
		<dt>auth/missing-phone-number</dt>
		<dd>Thrown if the phone number is missing.</dd>
		<dt>auth/quota-exceeded</dt>
		<dd>Thrown if the SMS quota for the Firebase project has been exceeded.</dd>
		</dl>
	**/
	function reauthenticateWithPhoneNumber(phoneNumber:String, applicationVerifier:firebase.auth.ApplicationVerifier):js.Promise<firebase.auth.ConfirmationResult>;
	/**
		Updates the user's email address.
		
		An email will be sent to the original email address (if it was set) that
		allows to revoke the email address change, in order to protect them from
		account hijacking.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call
		{@link firebase.User#reauthenticateWithCredential}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used is invalid.</dd>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if the email is already used by another user.</dd>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticateWithCredential} to
		    resolve. This does not apply if the user is anonymous.</dd>
		</dl>
	**/
	function updateEmail(newEmail:String):js.Promise<Dynamic>;
	/**
		Updates the user's password.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call
		{@link firebase.User#reauthenticateWithCredential}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/weak-password</dt>
		<dd>Thrown if the password is not strong enough.</dd>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticateWithCredential} to
		    resolve. This does not apply if the user is anonymous.</dd>
		</dl>
	**/
	function updatePassword(newPassword:String):js.Promise<Dynamic>;
	/**
		Updates the user's phone number.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-verification-code</dt>
		<dd>Thrown if the verification code of the credential is not valid.</dd>
		<dt>auth/invalid-verification-id</dt>
		<dd>Thrown if the verification ID of the credential is not valid.</dd>
		</dl>
	**/
	function updatePhoneNumber(phoneCredential:firebase.auth.AuthCredential):js.Promise<Dynamic>;
	/**
		Updates a user's profile data.
	**/
	function updateProfile(profile:Dynamic):js.Promise<Dynamic>;
	/**
		Deletes and signs out the user.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call
		{@link firebase.User#reauthenticateWithCredential}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticateWithCredential} to
		    resolve. This does not apply if the user is anonymous.</dd>
		</dl>
	**/
	function delete():js.Promise<Dynamic>;
	/**
		Returns a JSON-serializable representation of this object.
	**/
	function toJSON():Dynamic;
	/**
		Links the authenticated provider to the user account using a pop-up based
		OAuth flow.
		
		If the linking is successful, the returned result will contain the user
		and the provider's credential.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
		<dt>auth/cancelled-popup-request</dt>
		<dd>Thrown if successive popup operations are triggered. Only one popup
		    request is allowed at one time on a user or an auth instance. All the
		    popups would fail with this error except for the last one.</dd>
		<dt>auth/credential-already-in-use</dt>
		<dd>Thrown if the account corresponding to the credential already exists
		    among your users, or is already linked to a Firebase User.
		    For example, this error could be thrown if you are upgrading an anonymous
		    user to a Google user by linking a Google credential to it and the Google
		    credential used is already associated with an existing Firebase Google
		    user.
		    An <code>error.email</code> and <code>error.credential</code>
		    ({@link firebase.auth.AuthCredential}) fields are also provided. You can
		    recover from this error by signing in with that credential directly via
		    {@link firebase.auth.Auth#signInWithCredential}.</dd>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if the email corresponding to the credential already exists
		    among your users. When thrown while linking a credential to an existing
		    user, an <code>error.email</code> and <code>error.credential</code>
		    ({@link firebase.auth.AuthCredential}) fields are also provided.
		    You have to link the credential to the existing user with that email if
		    you wish to continue signing in with that credential. To do so, call
		    {@link firebase.auth.Auth#fetchProvidersForEmail}, sign in to
		    <code>error.email</code> via one of the providers returned and then
		    {@link firebase.User#linkWithCredential} the original credential to that
		    newly signed in user.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		<dt>auth/popup-blocked</dt>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dd>Thrown if the popup was blocked by the browser, typically when this
		    operation is triggered outside of a click handler.</dd>
		<dt>auth/popup-closed-by-user</dt>
		<dd>Thrown if the popup window is closed by the user without completing the
		    sign in to the provider.</dd>
		<dt>auth/provider-already-linked</dt>
		<dd>Thrown if the provider has already been linked to the user. This error is
		    thrown even if this is not the same provider's account that is currently
		    linked to the user.</dd>
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function linkWithPopup(provider:firebase.auth.AuthProvider):js.Promise<firebase.auth.UserCredential>;
	/**
		Links the authenticated provider to the user account using a full-page
		redirect flow.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dt>auth/provider-already-linked</dt>
		<dd>Thrown if the provider has already been linked to the user. This error is
		    thrown even if this is not the same provider's account that is currently
		    linked to the user.</dd>
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function linkWithRedirect(provider:firebase.auth.AuthProvider):js.Promise<Dynamic>;
	/**
		Reauthenticates the current user with the specified provider using a pop-up
		based OAuth flow.
		
		If the reauthentication is successful, the returned result will contain the
		user and the provider's credential.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
		<dt>auth/cancelled-popup-request</dt>
		<dd>Thrown if successive popup operations are triggered. Only one popup
		    request is allowed at one time on a user or an auth instance. All the
		    popups would fail with this error except for the last one.</dd>
		<dt>auth/user-mismatch</dt>
		<dd>Thrown if the credential given does not correspond to the user.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		<dt>auth/popup-blocked</dt>
		<dd>Thrown if the popup was blocked by the browser, typically when this
		    operation is triggered outside of a click handler.</dd>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dt>auth/popup-closed-by-user</dt>
		<dd>Thrown if the popup window is closed by the user without completing the
		    sign in to the provider.</dd>
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function reauthenticateWithPopup(provider:firebase.auth.AuthProvider):js.Promise<firebase.auth.UserCredential>;
	/**
		Reauthenticates the current user with the specified OAuth provider using a
		full-page redirect flow.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dt>auth/user-mismatch</dt>
		<dd>Thrown if the credential given does not correspond to the user.</dd>
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function reauthenticateWithRedirect(provider:firebase.auth.AuthProvider):js.Promise<Dynamic>;
	/**
		The user's unique ID.
	**/
	var uid : String;
	/**
		The authentication provider ID for the current user.
		For example, 'facebook.com', or 'google.com'.
	**/
	var providerId : String;
	/**
		The user's email address (if available).
	**/
	var email : String;
	/**
		The user's display name (if available).
	**/
	var displayName : String;
	/**
		The URL of the user's profile picture (if available).
	**/
	var photoURL : String;
}