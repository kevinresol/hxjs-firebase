package firebase;
@:jsRequire("firebase", "User") extern interface User extends firebase.UserInfo {
	var isAnonymous : Bool;
	/**
		True if the user's email address has been verified.
	**/
	var emailVerified : Bool;
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
	function getToken(?opt_forceRefresh:Bool):firebase.Promise<String>;
	/**
		Refreshes the current user, if signed in.
	**/
	function reload():firebase.Promise<Dynamic>;
	/**
		Sends a verification email to a user.
		
		The verification process is completed by calling
		{@link firebase.auth.Auth#applyActionCode}
	**/
	function sendEmailVerification():firebase.Promise<Dynamic>;
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
		    Please refer to the Guide, under the provider's section you tried to
		    link, and make sure you pass in the correct parameter to the credential
		    method.</dd>
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
		    {@link firebase.User#link} the original credential to that newly signed
		    in user.</dd>
		<dt>auth/operation-not-allowed</dt>
		<dd>Thrown if you have not enabled the provider in the Firebase Console. Go
		    to the Firebase Console for your project, in the Auth section and the
		    <strong>Sign in Method</strong> tab and configure the provider.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or when
		    the user associated with the email does not have a password.</dd>
		</dl>
	**/
	function link(credential:firebase.auth.AuthCredential):firebase.Promise<firebase.User>;
	/**
		Unlinks a provider from a user account.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/no-such-provider</dt>
		<dd>Thrown if the user does not have this provider linked or when the
		    provider ID given does not exist.</dd>
		</dt>
	**/
	function unlink(providerId:String):firebase.Promise<firebase.User>;
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
		    Please refer to the Guide, under the provider's section you tried to
		    link, and make sure you pass in the correct parameter to the credential
		    method.</dd>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is invalid.</dd>
		<dt>auth/wrong-password</dt>
		<dd>Thrown if the password used in a
		    {@link firebase.auth.EmailAuthProvider#credential} is not correct or when
		    the user associated with the email does not have a password.</dd>
		</dl>
	**/
	function reauthenticate(credential:firebase.auth.AuthCredential):firebase.Promise<Dynamic>;
	/**
		Updates the user's email address.
		
		An email will be sent to the original email address (if it was set) that
		allows to revoke the email address change, in order to protect them from
		account hijacking.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call {@link firebase.User#reauthenticate}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/invalid-email</dt>
		<dd>Thrown if the email used is invalid.</dd>
		<dt>auth/email-already-in-use</dt>
		<dd>Thrown if the email is already used by another user.</dd>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticate} to resolve. This does
		    not apply if the user is anonymous.</dd>
		</dl>
	**/
	function updateEmail(newEmail:String):firebase.Promise<Dynamic>;
	/**
		Updates the user's password.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call {@link firebase.User#reauthenticate}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/weak-password</dt>
		<dd>Thrown if the password is not strong enough.</dd>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticate} to resolve. This does
		    not apply if the user is anonymous.</dd>
		</dl>
	**/
	function updatePassword(newPassword:String):firebase.Promise<Dynamic>;
	/**
		Updates a user's profile data.
	**/
	function updateProfile(profile:Dynamic):firebase.Promise<Dynamic>;
	/**
		Deletes and signs out the user.
		
		<b>Important:</b> this is a security sensitive operation that requires the
		user to have recently signed in. If this requirement isn't met, ask the user
		to authenticate again and then call {@link firebase.User#reauthenticate}.
		
		<h4>Error Codes</h4>
		<dl>
		<dt>auth/requires-recent-login</dt>
		<dd>Thrown if the user's last sign-in time does not meet the security
		    threshold. Use {@link firebase.User#reauthenticate} to resolve. This does
		    not apply if the user is anonymous.</dd>
		</dl>
	**/
	function delete():firebase.Promise<Dynamic>;
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
		    {@link firebase.User#link} the original credential to that newly signed
		    in user.</dd>
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
	function linkWithPopup(provider:firebase.auth.AuthProvider):firebase.Promise<firebase.auth.UserCredential>;
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
	function linkWithRedirect(provider:firebase.auth.AuthProvider):firebase.Promise<Dynamic>;
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