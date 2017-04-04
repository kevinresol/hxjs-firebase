package firebase.app;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "app.App") extern interface App {
	/**
		The (read-only) name for this app.
		
		The default app's name is `"[DEFAULT]"`.
	**/
	var name : String;
	/**
		The (read-only) configuration options for this app. These are the original
		parameters given in
		{@link firebase#.initializeApp `firebase.initializeApp()`}.
	**/
	var options : Dynamic;
	/**
		Renders this app unusable and frees the resources of all associated
		services.
	**/
	function delete():js.Promise<Dynamic>;
	/**
		Gets the {@link firebase.auth.Auth `Auth`} service for the current app.
	**/
	function auth():firebase.auth.Auth;
	/**
		Gets the {@link firebase.database.Database `Database`} service for the
		current app.
	**/
	function database():firebase.database.Database;
	/**
		Gets the {@link firebase.messaging.Messaging `Messaging`} service for the
		current app.
	**/
	function messaging():firebase.messaging.Messaging;
	/**
		Gets the {@link firebase.storage.Storage `Storage`} service for the current
		app, optionally initialized with a custom storage bucket.
	**/
	function storage(?url:String):firebase.storage.Storage;
}