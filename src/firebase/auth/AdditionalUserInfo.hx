package firebase.auth;
extern typedef AdditionalUserInfo = {
	/**
		A structure containing additional user information from a federated identity
		provider.
	**/
	var AdditionalUserInfo : { var providerId : String; @:optional
	var profile : Dynamic; var username : String; };
}