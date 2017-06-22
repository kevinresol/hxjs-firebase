package firebase.auth;
@:jsRequire("firebase", "auth.Auth") extern interface Auth {
	/**
		Checks a password reset code sent to the user by email or other out-of-band
		mechanism.
		
		Returns the user's email address if valid.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/expired-action-code</dt>
		<dd>Thrown if the password reset code has expired.</dd>
		<dt>auth/invalid-action-code</dt>
		<dd>Thrown if the password reset code is invalid. This can happen if the code
		    is malformed or has already been used.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given password reset code has
		    been disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the password reset code. This
		    may have happened if the user was deleted between when the code was
		    issued and when this method was called.</dd>
		</dl>
	**/
	function verifyPasswordResetCode(code:String):js.Promise<String>;
	/**
		Checks a verification code sent to the user by email or other out-of-band
		mechanism.
		
		Returns metadata about the code.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/expired-action-code</dt>
		<dd>Thrown if the action code has expired.</dd>
		<dt>auth/invalid-action-code</dt>
		<dd>Thrown if the action code is invalid. This can happen if the code is
		    malformed or has already been used.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given action code has been
		    disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the action code. This may
		    have happened if the user was deleted between when the action code was
		    issued and when this method was called.</dd>
		</dl>
	**/
	function checkActionCode(code:String):js.Promise<firebase.auth.ActionCodeInfo>;
	/**
		Applies a verification code sent to the user by email or other out-of-band
		mechanism.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/expired-action-code</dt>
		<dd>Thrown if the action code has expired.</dd>
		<dt>auth/invalid-action-code</dt>
		<dd>Thrown if the action code is invalid. This can happen if the code is
		    malformed or has already been used.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given action code has been
		    disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the action code. This may
		    have happened if the user was deleted between when the action code was
		    issued and when this method was called.</dd>
		</dl>
	**/
	function applyActionCode(code:String):js.Promise<Dynamic>;
	/**
		The {@link firebase.app.App app} associated with the `Auth` service
		instance.
	**/
	var app : firebase.app.App;
	/**
		The currently signed-in user (or null).
	**/
	var currentUser : firebase.User;
	/**
		Creates a new user account associated with the specified email address and
		password.
		
		On successful creation of the user account, this user will also be
		signed in to your application.
		
		User account creation can fail if the account already exists or the password
		is invalid.
		
		Note: The email address acts as a unique identifier for the user and
		enables an email-based password reset.  This function will create
		a new user account and set the initial user password.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if there already exists an account with the given email
		    address.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if email/password accounts are not enabled. Enable email/password
		    accounts in the Firebase Console, under the Auth tab.</dd>
		<dt>auth/weak-password</dt>
		<dd>Thrown if the password is not strong enough.</dd>
		</dl>
	**/
	function createUserWithEmailAndPassword(email:String, password:String):js.Promise<firebase.User>;
	/**
		Gets the list of provider IDs that can be used to sign in for the given email
		address. Useful for an "identifier-first" sign-in flow.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		</dl>
	**/
	function fetchProvidersForEmail(email:String):js.Promise<Array<String>>;
	/**
		Adds an observer for changes to the user's sign-in state.
		
		Prior to 4.0.0, this triggered the observer when users were signed in,
		signed out, or when the user's ID token changed in situations such as token
		expiry or password change. After 4.0.0, the observer is only triggered
		on sign-in or sign-out.
		
		To keep the old behavior, see {@link firebase.auth.Auth#onIdTokenChanged}.
	**/
	function onAuthStateChanged(nextOrObserver:haxe.extern.EitherType<Dynamic, Dynamic>, ?error:Dynamic, ?completed:Dynamic):Dynamic;
	/**
		Adds an observer for changes to the signed-in user's ID token, which includes
		sign-in, sign-out, and token refresh events. This method has the same
		behavior as {@link firebase.auth.Auth#onAuthStateChanged} had prior to 4.0.0.
	**/
	function onIdTokenChanged(nextOrObserver:haxe.extern.EitherType<Dynamic, Dynamic>, ?error:Dynamic, ?completed:Dynamic):Dynamic;
	/**
		Sends a password reset email to the given email address.
		
		To complete the password reset, call
		{@link firebase.auth.Auth#confirmPasswordReset} with the code supplied in the
		email sent to the user, along with the new password specified by the user.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the email address.</dd>
		</dl>
	**/
	function sendPasswordResetEmail(email:String):js.Promise<Dynamic>;
	/**
		Completes the password reset process, given a confirmation code and new
		password.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/expired-action-code</dt>
		<dd>Thrown if the password reset code has expired.</dd>
		<dt>auth/invalid-action-code</dt>
		<dd>Thrown if the password reset code is invalid. This can happen if the
		    code is malformed or has already been used.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given password reset code has
		    been disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the password reset code. This
		    may have happened if the user was deleted between when the code was
		    issued and when this method was called.</dd>
		<dt>auth/weak-password</dt>
		<dd>Thrown if the new password is not strong enough.</dd>
		</dl>
	**/
	function confirmPasswordReset(code:String, newPassword:String):js.Promise<Dynamic>;
	/**
		Asynchronously signs in with the given credentials.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/account-exists-with-different-credential</dt>
		<dd>Thrown if there already exists an account with the email address
		    asserted by the credential. Resolve this by calling
		    {@link firebase.auth.Auth#fetchProvidersForEmail} and then asking the
		    user to sign in using one of the returned providers. Once the user is
		    signed in, the original credential can be linked to the user with
		    {@link firebase.User#linkWithCredential}.</dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the credential is malformed or has expired.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if the type of account corresponding to the credential
		    is not enabled. Enable the account type in the Firebase Console, under
		    the Auth tab.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given credential has been
		    disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if signing in with a credential from
		    {@link firebase.auth.EmailAuthProvider#credential} and there is no user
		    corresponding to the given email. </dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if signing in with a credential from
		    {@link firebase.auth.EmailAuthProvider#credential} and the password is
		    invalid for the given email, or if the account corresponding to the email
		    does not have a password set.</dd>
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
	function signInWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.User>;
	/**
		Asynchronously signs in with the given credentials, and returns any available
		additional user information, such as user name.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/account-exists-with-different-credential</dt>
		<dd>Thrown if there already exists an account with the email address
		    asserted by the credential. Resolve this by calling
		    {@link firebase.auth.Auth#fetchProvidersForEmail} and then asking the
		    user to sign in using one of the returned providers. Once the user is
		    signed in, the original credential can be linked to the user with
		    {@link firebase.User#linkWithCredential}.</dd>
		<dt>auth/invalid-credential</dt>
		<dd>Thrown if the credential is malformed or has expired.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if the type of account corresponding to the credential
		    is not enabled. Enable the account type in the Firebase Console, under
		    the Auth tab.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given credential has been
		    disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if signing in with a credential from
		    {@link firebase.auth.EmailAuthProvider#credential} and there is no user
		    corresponding to the given email. </dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if signing in with a credential from
		    {@link firebase.auth.EmailAuthProvider#credential} and the password is
		    invalid for the given email, or if the account corresponding to the email
		    does not have a password set.</dd>
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
	function signInAndRetrieveDataWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Asynchronously signs in using a custom token.
		
		Custom tokens are used to integrate Firebase Auth with existing auth systems,
		and must be generated by the auth backend.
		
		Fails with an error if the token is invalid, expired, or not accepted by the
		Firebase Auth service.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/custom-token-mismatch</dt>
		<dd>Thrown if the custom token is for a different Firebase App.</dd>
		<dt>auth/invalid-custom-token</dt>
		<dd>Thrown if the custom token format is incorrect.</dd>
		</dl>
	**/
	function signInWithCustomToken(token:String):js.Promise<firebase.User>;
	/**
		Asynchronously signs in using an email and password.
		
		Fails with an error if the email address and password do not match.
		
		Note: The user's password is NOT the password used to access the user's email
		account. The email address serves as a unique identifier for the user, and
		the password is used to access the user's account in your Firebase project.
		
		See also: {@link firebase.auth.Auth#createUserWithEmailAndPassword}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given email has been
		    disabled.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the given email.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password is invalid for the given email, or the account
		    corresponding to the email does not have a password set.</dd>
		</dl>
	**/
	function signInWithEmailAndPassword(email:String, password:String):js.Promise<firebase.User>;
	/**
		Asynchronously signs in using a phone number. This method sends a code via
		SMS to the given phone number, and returns a
		{@link firebase.auth.ConfirmationResult}. After the user provides the code
		sent to their phone, call {@link firebase.auth.ConfirmationResult#confirm}
		with the code to sign the user in.
		
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
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		</dl>
	**/
	function signInWithPhoneNumber(phoneNumber:String, applicationVerifier:firebase.auth.ApplicationVerifier):js.Promise<firebase.auth.ConfirmationResult>;
	/**
		Asynchronously signs in as an anonymous user.
		
		If there is already an anonymous user signed in, that user will be returned;
		otherwise, a new anonymous user identity will be created and returned.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if anonymous accounts are not enabled. Enable anonymous accounts
		    in the Firebase Console, under the Auth tab.</dd>
		</dl>
	**/
	function signInAnonymously():js.Promise<firebase.User>;
	/**
		Signs out the current user.
	**/
	function signOut():js.Promise<Dynamic>;
	/**
		Authenticates a Firebase client using a popup-based OAuth authentication
		flow.
		
		If succeeds, returns the signed in user along with the provider's credential.
		If sign in was unsuccessful, returns an error object containing additional
		information about the error.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/account-exists-with-different-credential</dt>
		<dd>Thrown if there already exists an account with the email address
		    asserted by the credential. Resolve this by calling
		    {@link firebase.auth.Auth#fetchProvidersForEmail} with the error.email
		    and then asking the user to sign in using one of the returned providers.
		    Once the user is signed in, the original credential retrieved from the
		    error.credential can be linked to the user with
		    {@link firebase.User#linkWithCredential} to prevent the user from signing
		    in again to the original provider via popup or redirect. If you are using
		    redirects for sign in, save the credential in session storage and then
		    retrieve on redirect and repopulate the credential using for example
		    {@link firebase.auth.GoogleAuthProvider#credential} depending on the
		    credential provider id and complete the link.</dd>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
		<dt>auth/cancelled-popup-request</dt>
		<dd>Thrown if successive popup operations are triggered. Only one popup
		    request is allowed at one time. All the popups would fail with this error
		    except for the last one.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if the type of account corresponding to the credential
		    is not enabled. Enable the account type in the Firebase Console, under
		    the Auth tab.</dd>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dt>auth/popup-blocked</dt>
		<dd>Thrown if the popup was blocked by the browser, typically when this
		    operation is triggered outside of a click handler.</dd>
		<dt>auth/popup-closed-by-user</dt>
		<dd>Thrown if the popup window is closed by the user without completing the
		    sign in to the provider.</dd>
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function signInWithPopup(provider:firebase.auth.AuthProvider):js.Promise<firebase.auth.UserCredential>;
	/**
		Authenticates a Firebase client using a full-page redirect flow. To handle
		the results and errors for this operation, refer to {@link
		firebase.auth.Auth#getRedirectResult}.
		
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
		<dt>auth/unauthorized-domain</dt>
		<dd>Thrown if the app domain is not authorized for OAuth operations for your
		    Firebase project. Edit the list of authorized domains from the Firebase
		    console.</dd>
		</dl>
	**/
	function signInWithRedirect(provider:firebase.auth.AuthProvider):js.Promise<Dynamic>;
	/**
		Returns a UserCredential from the redirect-based sign-in flow.
		
		If sign-in succeeded, returns the signed in user. If sign-in was
		unsuccessful, fails with an error. If no redirect operation was called,
		returns a UserCredential with a null User.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/account-exists-with-different-credential</dt>
		<dd>Thrown if there already exists an account with the email address
		    asserted by the credential. Resolve this by calling
		    {@link firebase.auth.Auth#fetchProvidersForEmail} with the error.email
		    and then asking the user to sign in using one of the returned providers.
		    Once the user is signed in, the original credential retrieved from the
		    error.credential can be linked to the user with
		    {@link firebase.User#linkWithCredential} to prevent the user from signing
		    in again to the original provider via popup or redirect. If you are using
		    redirects for sign in, save the credential in session storage and then
		    retrieve on redirect and repopulate the credential using for example
		    {@link firebase.auth.GoogleAuthProvider#credential} depending on the
		    credential provider id and complete the link.</dd>
		<dt>auth/auth-domain-config-required</dt>
		<dd>Thrown if authDomain configuration is not provided when calling
		    firebase.initializeApp(). Check Firebase Console for instructions on
		    determining and passing that field.</dd>
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
		<dd>Thrown if the type of account corresponding to the credential
		    is not enabled. Enable the account type in the Firebase Console, under
		    the Auth tab.</dd>
		<dt>auth/operation-not-supported-in-this-environment</dt>
		<dd>Thrown if this operation is not supported in the environment your
		    application is running on. "location.protocol" must be http or https.
		    </dd>
		<dt>auth/timeout</dt>
		<dd>Thrown typically if the app domain is not authorized for OAuth operations
		    for your Firebase project. Edit the list of authorized domains from the
		    Firebase console.</dd>
		</dl>
	**/
	function getRedirectResult():js.Promise<firebase.auth.UserCredential>;
}