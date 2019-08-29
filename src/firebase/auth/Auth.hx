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
		Changes the current type of persistence on the current Auth instance for the
		currently saved Auth session and applies this type of persistence for
		future sign-in requests, including sign-in with redirect requests. This will
		return a promise that will resolve once the state finishes copying from one
		type of storage to the other.
		Calling a sign-in method after changing persistence will wait for that
		persistence change to complete before applying it on the new Auth state.
		
		This makes it easy for a user signing in to specify whether their session
		should be remembered or not. It also makes it easier to never persist the
		Auth state for applications that are shared by other users or have sensitive
		data.
		
		The default for web browser apps and React Native apps is 'local' (provided
		the browser supports this mechanism) whereas it is 'none' for Node.js backend
		apps.
		
		<h4>Error Codes (thrown synchronously)</h4>
		<dl>
		<dt>auth/invalid-persistence-type</dt>
		<dd>Thrown if the specified persistence type is invalid.</dd>
		<dt>auth/unsupported-persistence-type</dt>
		<dd>Thrown if the current environment does not support the specified
		    persistence type.</dd>
		</dl>
	**/
	function setPersistence(persistence:firebase.auth.Auth.Persistence):js.Promise<Dynamic>;
	/**
		The current Auth instance's language code. This is a readable/writable
		property. When set to null, the default Firebase Console language setting
		is applied. The language code will propagate to email action templates
		(password reset, email verification and email change revocation), SMS
		templates for phone authentication, reCAPTCHA verifier and OAuth
		popup/redirect operations provided the specified providers support
		localization with the language code specified.
	**/
	var languageCode : String;
	/**
		Sets the current language to the default device/browser preference.
	**/
	function useDeviceLanguage():Void;
	/**
		The current Auth instance's settings. This is used to edit/read configuration
		related options like app verification mode for phone authentication.
	**/
	var settings : firebase.auth.AuthSettings;
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
	function createUserWithEmailAndPassword(email:String, password:String):js.Promise<firebase.auth.UserCredential>;
	/**
		Gets the list of possible sign in methods for the given email address. This
		is useful to differentiate methods of sign-in for the same provider,
		eg. `EmailAuthProvider` which has 2 methods of sign-in, email/password and
		email/link.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		</dl>
	**/
	function fetchSignInMethodsForEmail(email:String):js.Promise<Array<String>>;
	/**
		Checks if an incoming link is a sign-in with email link.
	**/
	function isSignInWithEmailLink(emailLink:String):Bool;
	/**
		Adds an observer for changes to the user's sign-in state.
		
		Prior to 4.0.0, this triggered the observer when users were signed in,
		signed out, or when the user's ID token changed in situations such as token
		expiry or password change. After 4.0.0, the observer is only triggered
		on sign-in or sign-out.
		
		To keep the old behavior, see {@link firebase.auth.Auth#onIdTokenChanged}.
	**/
	function onAuthStateChanged(nextOrObserver:haxe.extern.EitherType<haxe.Constraints.Function, firebase.Observer<haxe.extern.EitherType<firebase.auth.Error, firebase.User>>>, ?error:haxe.Constraints.Function, ?completed:firebase.CompleteFn):firebase.Unsubscribe;
	/**
		Adds an observer for changes to the signed-in user's ID token, which includes
		sign-in, sign-out, and token refresh events. This method has the same
		behavior as {@link firebase.auth.Auth#onAuthStateChanged} had prior to 4.0.0.
	**/
	function onIdTokenChanged(nextOrObserver:haxe.extern.EitherType<haxe.Constraints.Function, firebase.Observer<haxe.extern.EitherType<firebase.auth.Error, firebase.User>>>, ?error:haxe.Constraints.Function, ?completed:firebase.CompleteFn):firebase.Unsubscribe;
	/**
		Sends a sign-in email link to the user with the specified email.
		
		The sign-in operation has to always be completed in the app unlike other out
		of band email actions (password reset and email verifications). This is
		because, at the end of the flow, the user is expected to be signed in and
		their Auth state persisted within the app.
		
		To complete sign in with the email link, call
		{@link firebase.auth.Auth#signInWithEmailLink} with the email address and
		the email link supplied in the email sent to the user.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/argument-error</dt>
		<dd>Thrown if handleCodeInApp is false.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/missing-android-pkg-name</dt>
		<dd>An Android package name must be provided if the Android app is required
		    to be installed.</dd>
		<dt>auth/missing-continue-uri</dt>
		<dd>A continue URL must be provided in the request.</dd>
		<dt>auth/missing-ios-bundle-id</dt>
		<dd>An iOS Bundle ID must be provided if an App Store ID is provided.</dd>
		<dt>auth/invalid-continue-uri</dt>
		<dd>The continue URL provided in the request is invalid.</dd>
		<dt>auth/unauthorized-continue-uri</dt>
		<dd>The domain of the continue URL is not whitelisted. Whitelist
		    the domain in the Firebase console.</dd>
		</dl>
	**/
	function sendSignInLinkToEmail(email:String, actionCodeSettings:firebase.auth.ActionCodeSettings):js.Promise<Dynamic>;
	/**
		Sends a password reset email to the given email address.
		
		To complete the password reset, call
		{@link firebase.auth.Auth#confirmPasswordReset} with the code supplied in the
		email sent to the user, along with the new password specified by the user.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/missing-android-pkg-name</dt>
		<dd>An Android package name must be provided if the Android app is required
		    to be installed.</dd>
		<dt>auth/missing-continue-uri</dt>
		<dd>A continue URL must be provided in the request.</dd>
		<dt>auth/missing-ios-bundle-id</dt>
		<dd>An iOS Bundle ID must be provided if an App Store ID is provided.</dd>
		<dt>auth/invalid-continue-uri</dt>
		<dd>The continue URL provided in the request is invalid.</dd>
		<dt>auth/unauthorized-continue-uri</dt>
		<dd>The domain of the continue URL is not whitelisted. Whitelist
		    the domain in the Firebase console.</dd>
		<dt>auth/user-not-found</dt>
		<dd>Thrown if there is no user corresponding to the email address.</dd>
		</dl>
	**/
	function sendPasswordResetEmail(email:String, ?actionCodeSettings:firebase.auth.ActionCodeSettings):js.Promise<Dynamic>;
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
		    {@link firebase.auth.Auth#fetchSignInMethodsForEmail} and then asking the
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
	function signInWithCredential(credential:firebase.auth.AuthCredential):js.Promise<firebase.auth.UserCredential>;
	/**
		Asynchronously signs in with the given credentials, and returns any available
		additional user information, such as user name.
		
		This method is deprecated. Use
		{@link firebase.auth.Auth#signInWithCredential} instead.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/account-exists-with-different-credential</dt>
		<dd>Thrown if there already exists an account with the email address
		    asserted by the credential. Resolve this by calling
		    {@link firebase.auth.Auth#fetchSignInMethodsForEmail} and then asking the
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
	function signInWithCustomToken(token:String):js.Promise<firebase.auth.UserCredential>;
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
	function signInWithEmailAndPassword(email:String, password:String):js.Promise<firebase.auth.UserCredential>;
	/**
		Asynchronously signs in using an email and sign-in email link. If no link
		is passed, the link is inferred from the current URL.
		
		Fails with an error if the email address is invalid or OTP in email link
		expires.
		
		Note: Confirm the link is a sign-in email link before calling this method
		{@link firebase.auth.Auth#isSignInWithEmailLink}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/expired-action-code</dt>
		<dd>Thrown if OTP in email link expires.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email address is not valid.</dd>
		<dt>auth/user-disabled</dt>
		<dd>Thrown if the user corresponding to the given email has been
		    disabled.</dd>
		</dl>
	**/
	function signInWithEmailLink(email:String, ?emailLink:String):js.Promise<firebase.auth.UserCredential>;
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
	function signInAnonymously():js.Promise<firebase.auth.UserCredential>;
	/**
		Asynchronously sets the provided user as `currentUser` on the current Auth
		instance. A new instance copy of the user provided will be made and set as
		`currentUser`.
		
		This will trigger {@link firebase.auth.Auth#onAuthStateChanged} and
		{@link firebase.auth.Auth#onIdTokenChanged} listeners like other sign in
		methods.
		
		The operation fails with an error if the user to be updated belongs to a
		different Firebase project.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-user-token</dt>
		<dd>Thrown if the user to be updated belongs to a diffent Firebase
		    project.</dd>
		<dt>auth/user-token-expired</dt>
		<dd>Thrown if the token of the user to be updated is expired.</dd>
		<dt>auth/null-user</dt>
		<dd>Thrown if the user to be updated is null.</dd>
		</dl>
	**/
	function updateCurrentUser(?user:firebase.User):js.Promise<Dynamic>;
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
@:jsRequire("firebase", "auth.Auth.Persistence") @:enum extern abstract Persistence(String) {
	/**
		Indicates that the state will be persisted even when the browser window is
		closed or the activity is destroyed in react-native.
	**/
	var LOCAL;
	/**
		Indicates that the state will only be stored in memory and will be cleared
		when the window or activity is refreshed.
	**/
	var NONE;
	/**
		Indicates that the state will only persist in current session/tab, relevant
		to web only, and will be cleared when the tab is closed.
	**/
	var SESSION;
}