package firebase;
@:jsRequire("firebase", "FirebaseError") extern interface FirebaseError {
	/**
		Error codes are strings using the following format: `"service/string-code"`.
		Some examples include `"app/no-app"` and `"auth/user-not-found"`.
		
		While the message for a given error can change, the code will remain the same
		between backward-compatible versions of the Firebase SDK.
	**/
	var code : String;
	/**
		An explanatory message for the error that just occurred.
		
		This message is designed to be helpful to you, the developer. It is not
		intended to be displayed to the end user of your application (as it will
		generally not convey meaningful information to them).
	**/
	var message : String;
	/**
		The name of the class of errors, namely `"FirebaseError"`.
	**/
	var name : String;
	/**
		A string value containing the execution backtrace when the error originally
		occurred. This may not always be available.
		
		This information can be useful to you and can be sent to
		{@link https://firebase.google.com/support/ Firebase Support} to help
		explain the cause of an error.
	**/
	var stack : String;
}