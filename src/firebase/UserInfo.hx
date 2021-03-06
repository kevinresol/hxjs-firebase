package firebase;
@:jsRequire("firebase", "UserInfo") extern interface UserInfo {
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
	/**
		The user's E.164 formatted phone number (if available).
	**/
	var phoneNumber : String;
}