package firebase.auth;
extern typedef UserCredential = {
	/**
		A structure containing a User, an AuthCredential, the operationType, and
		any additional user information that was returned from the identity provider.
		operationType could be 'signIn' for a sign-in operation, 'link' for a linking
		operation and 'reauthenticate' for a reauthentication operation.
	**/
	@:optional var user : firebase.User;
	@:optional var credential : firebase.auth.AuthCredential;
	var operationType : String;
	var additionalUserInfo : firebase.auth.AdditionalUserInfo;
}