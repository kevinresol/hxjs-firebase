package firebase.auth;
@:jsRequire("firebase", "auth.IdTokenResult") extern interface IdTokenResult {
	/**
		The Firebase Auth ID token JWT string.
	**/
	var token : String;
	/**
		The ID token expiration time formatted as a UTC string.
	**/
	var expirationTime : String;
	/**
		The authentication time formatted as a UTC string. This is the time the
		user authenticated (signed in) and not the time the token was refreshed.
	**/
	var authTime : String;
	/**
		The ID token issued at time formatted as a UTC string.
	**/
	var issuedAtTime : String;
	/**
		The sign-in provider through which the ID token was obtained (anonymous,
		custom, phone, password, etc). Note, this does not map to provider IDs.
	**/
	var signInProvider : String;
	/**
		The entire payload claims of the ID token including the standard reserved
		claims as well as the custom claims.
	**/
	var claims : Dynamic;
}