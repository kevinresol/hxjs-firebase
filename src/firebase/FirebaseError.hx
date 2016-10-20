package firebase;
extern interface FirebaseError {
	/**
		Error codes are strings using the following format:
		
		  "service/string-code"
		
		While the message for a given error can change, the code will remain the same
		between backward-compatible versions of the Firebase SDK.
	**/
	var code : String;
	/**
		An explanatory message for the error that just occurred.
		
		This message is designed to be helpful to you, the developer.  It
		is not intended that you display it to the end user of your application
		(as it will generally not convey meaningful information to them).
	**/
	var message : String;
	/**
		The name of the class of Errors.
	**/
	var name : String;
	/**
		A string value containing the execution backtrace when the error originally
		occurred.
		
		This information can be useful to you and can be sent to Firebase support to
		help explain the cause of an error.
	**/
	var stack : String;
}