package firebase.auth;
@:jsRequire("firebase", "auth.AuthCredential") extern interface AuthCredential {
	/**
		The authentication provider ID for the credential.
		For example, 'facebook.com', or 'google.com'.
	**/
	var providerId : String;
	/**
		The authentication sign in method for the credential.
		For example, 'password', or 'emailLink. This corresponds to the sign-in
		method identifier as returned in
		{@link firebase.auth.Auth#fetchSignInMethodsForEmail}.
	**/
	var signInMethod : String;
	/**
		Static method to deserialize a JSON representation of an object into an
		{@link firebase.auth.AuthCredential}. Input can be either Object or the
		stringified representation of the object. When string is provided,
		JSON.parse would be called first. If the JSON input does not represent an
		`AuthCredential`, null is returned.
	**/
	static function fromJSON(json:haxe.extern.EitherType<Dynamic, String>):firebase.auth.AuthCredential;
	/**
		Returns a JSON-serializable representation of this object.
	**/
	function toJSON():Dynamic;
}