package firebase;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end) extern class Firebase {
	/**
		Creates and initializes a Firebase {@link firebase.app.App app} instance.
		
		See
		{@link
		  https://firebase.google.com/docs/web/setup#add_firebase_to_your_app
		  Add Firebase to your app} and
		{@link
		  https://firebase.google.com/docs/web/setup#initialize_multiple_apps
		  Initialize multiple apps} for detailed documentation.
	**/
	static function initializeApp(options:Dynamic, ?name:String):firebase.app.App;
	/**
		Retrieves a Firebase {@link firebase.app.App app} instance.
		
		When called with no arguments, the default app is returned. When an app name
		is provided, the app corresponding to that name is returned.
		
		An exception is thrown if the app being retrieved has not yet been
		initialized.
	**/
	static function app(?name:String):firebase.app.App;
	/**
		A (read-only) array of all initialized apps.
	**/
	static var apps : Array<firebase.app.App>;
	/**
		The current SDK version.
	**/
	static var SDK_VERSION : String;
	/**
		Gets the {@link firebase.auth.Auth `Auth`} service for the default app or a
		given app.
		
		`firebase.auth()` can be called with no arguments to access the default app's
		{@link firebase.auth.Auth `Auth`} service or as `firebase.auth(app)` to
		access the {@link firebase.auth.Auth `Auth`} service associated with a
		specific app.
	**/
	static function auth(?app:firebase.app.App):firebase.auth.Auth;
	/**
		Gets the {@link firebase.database.Database `Database`} service for the
		default app or a given app.
		
		`firebase.database()` can be called with no arguments to access the default
		app's {@link firebase.database.Database `Database`} service or as
		`firebase.database(app)` to access the
		{@link firebase.database.Database `Database`} service associated with a
		specific app.
		
		`firebase.database` is also a namespace that can be used to access global
		constants and methods associated with the `Database` service.
	**/
	static function database(?app:firebase.app.App):firebase.database.Database;
	/**
		Gets the {@link firebase.messaging.Messaging `Messaging`} service for the
		default app or a given app.
		
		`firebase.messaging()` can be called with no arguments to access the default
		app's {@link firebase.messaging.Messaging `Messaging`} service or as
		`firebase.messaging(app)` to access the
		{@link firebase.messaging.Messaging `Messaging`} service associated with a
		specific app.
		
		Calling `firebase.messaging()` in a service worker results in Firebase
		generating notifications if the push message payload has a `notification`
		parameter.
	**/
	static function messaging(?app:firebase.app.App):firebase.messaging.Messaging;
	/**
		Gets the {@link firebase.storage.Storage `Storage`} service for the default
		app or a given app.
		
		`firebase.storage()` can be called with no arguments to access the default
		app's {@link firebase.storage.Storage `Storage`} service or as
		`firebase.storage(app)` to access the
		{@link firebase.storage.Storage `Storage`} service associated with a
		specific app.
	**/
	static function storage(?app:firebase.app.App):firebase.storage.Storage;
}