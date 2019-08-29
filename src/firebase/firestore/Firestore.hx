package firebase.firestore;
@:jsRequire("firebase", "firestore.Firestore") extern interface Firestore {
	/**
		Sets the verbosity of Cloud Firestore logs (debug, error, or silent).
	**/
	function setLogLevel(logLevel:String):Void;
	/**
		Specifies custom settings to be used to configure the `Firestore`
		instance. Must be set before invoking any other methods.
	**/
	function settings(settings:firebase.firestore.Settings):Void;
	/**
		Attempts to enable persistent storage, if possible.
		
		Must be called before any other methods (other than settings()).
		
		If this fails, enablePersistence() will reject the promise it returns.
		Note that even after this failure, the firestore instance will remain
		usable, however offline persistence will be disabled.
		
		There are several reasons why this can fail, which can be identified by
		the `code` on the error.
		
		  * failed-precondition: The app is already open in another browser tab.
		  * unimplemented: The browser is incompatible with the offline
		    persistence implementation.
	**/
	function enablePersistence():js.Promise<Dynamic>;
	/**
		Re-enables use of the network for this Firestore instance after a prior
		call to {@link firebase.firestore.Firestore#disableNetwork
		`disableNetwork()`}.
	**/
	function enableNetwork():js.Promise<Dynamic>;
	/**
		Disables network usage for this instance. It can be re-enabled via
		{@link firebase.firestore.Firestore#enableNetwork `enableNetwork()`}. While
		the network is disabled, any snapshot listeners or get() calls will return
		results from cache, and any write operations will be queued until the network
		is restored.
	**/
	function disableNetwork():js.Promise<Dynamic>;
	/**
		Gets a `CollectionReference` instance that refers to the collection at
		the specified path.
	**/
	function collection(collectionPath:String):firebase.firestore.CollectionReference;
	/**
		Gets a `DocumentReference` instance that refers to the document at the
		specified path.
	**/
	function doc(documentPath:String):firebase.firestore.DocumentReference;
	/**
		Executes the given `updateFunction` and then attempts to commit the changes
		applied within the transaction. If any document read within the transaction
		has changed, Cloud Firestore retries the `updateFunction`. If it fails to
		commit after 5 attempts, the transaction fails.
	**/
	function runTransaction(updateFunction:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Creates a write batch, used for performing multiple writes as a single
		atomic operation.
	**/
	function batch():firebase.firestore.WriteBatch;
	/**
		The {@link firebase.app.App app} associated with this `Firestore` service
		instance.
	**/
	var app : firebase.app.App;
}