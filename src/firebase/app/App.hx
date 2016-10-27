package firebase.app;
@:jsRequire("firebase.app", "App") extern interface App {
	/**
		The (read-only) name (identifier) for this App. '[DEFAULT]' is the name of
		the default App.
	**/
	var name : String;
	/**
		The (read-only) configuration options (the original parameters given
		in <code>firebase.initializeApp()</code>).
	**/
	var options : Dynamic;
	/**
		Make the given App unusable and free the resources of all associated
		services.
	**/
	function delete():js.Promise<Dynamic>;
	/**
		Gets the Firebase Auth Service object for an App.
		
		Usage:
		
		  app.auth()
	**/
	function auth():firebase.auth.Auth;
	/**
		Access the Database service from an App instance.
	**/
	function database():firebase.database.Database;
	/**
		Access the Storage service from an App instance.
		
		Usage:
		
		  app.storage()
	**/
	function storage():firebase.storage.Storage;
}