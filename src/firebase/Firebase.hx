package firebase;
@:jsRequire("firebase") extern class Firebase {
	/**
		Create (and intialize) a FirebaseApp.
	**/
	static function initializeApp(options:Dynamic, ?name:String):firebase.app.App;
	/**
		Retrieve an instance of a FirebaseApp.
		
		With no arguments, this returns the default App.  With a single
		string argument, it returns the named App.
		
		This function throws an exception if the app you are trying to access
		does not exist.
		
		Usage: firebase.app()
	**/
	static function app(name:String):firebase.app.App;
	/**
		A (read-only) array of all the initialized Apps.
	**/
	static var apps : Array<firebase.app.App>;
	/**
		The current SDK version ('3.5.1').
	**/
	static var SDK_VERSION : String;
	/**
		Gets the Auth object for the default App or a given App.
		
		Usage:
		
		  firebase.auth()
		  firebase.auth(app)
	**/
	static function auth(?app:firebase.app.App):firebase.auth.Auth;
	/**
		Access the Database service for the default App (or a given app).
		
		`firebase.database()` can be called as a function to access the default
		{@link firebase.database.Database}, or as `firebase.database(app)` to access
		the database associated with a specific {@link firebase.app.App}.
		
		`firebase.database` is also a namespace that can be used to access
		global constants and methods associated with the database service.
	**/
	static function database(?app:firebase.app.App):firebase.database.Database;
	/**
		Create an object to access the Messaging service for the default App
		(or a given app).
		
		`firebase.messaging()` can be called as a function to access the default
		{@link firebase.messaging.Messaging}, or as `firebase.messaging(app)` to
		access the messaging associated with a specific {@link firebase.app.App}.
		
		Calling `firebase.messaging()` in a service worker results in firebase
		generating notifications if the push message payload has a `notification`
		parameter.
	**/
	static function messaging(?app:firebase.app.App):firebase.messaging.Messaging;
	/**
		The namespace for all Firebase Storage functionality.
		The returned service is initialized with a particular app which contains the
		project's storage location, or uses the default app if none is provided.
		
		Usage (either):
		
		```
		firebase.storage()
		firebase.storage(app)
		```
	**/
	static function storage(?app:firebase.app.App):firebase.storage.Storage;
}