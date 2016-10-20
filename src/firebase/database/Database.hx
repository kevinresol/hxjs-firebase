package firebase.database;
extern interface Database {
	/**
		The App associated with the Database service instance.
	**/
	var app : firebase.app.App;
	/**
		Returns a `Reference` to the root or the specified path.
	**/
	function ref(?path:String):firebase.database.Reference;
	/**
		Returns a reference to the root or the path specified in url. An exception is
		thrown if the url is not in the same domain as the current database.
	**/
	function refFromURL(url:String):firebase.database.Reference;
	/**
		Disconnect from the server (all database operations will be completed
		offline).
		
		The client automatically maintains a persistent connection to the database
		server, which will remain active indefinitely and reconnect when
		disconnected. However, the `goOffline()` and `goOnline()` methods may be used
		to control the client connection in cases where a persistent connection is
		undesirable.
		
		While offline, the client will no longer receive data updates from the
		database. However, all database operations performed locally will continue to
		immediately fire events, allowing your application to continue behaving
		normally. Additionally, each operation performed locally will automatically
		be queued and retried upon reconnection to the database server.
		
		To reconnect to the database and begin receiving remote events, see
		`goOnline()`.
	**/
	function goOffline():Void;
	/**
		(Re)connect to the server and synchronize the offline database state
		with the server state.
		
		This method should be used after disabling the active connection with
		`goOffline()`. Once reconnected, the client will transmit the proper data and
		fire the appropriate events so that your client "catches up" automatically.
	**/
	function goOnline():Void;
}