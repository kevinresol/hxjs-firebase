package firebase.auth;
extern typedef UserCredential = {
	/**
		A structure containing a User and an AuthCredential.
	**/
	var UserCredential : { @:optional
	var user : firebase.User; @:optional
	var credential : firebase.auth.AuthCredential; };
}