package firebase.storage;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "storage.Storage") extern interface Storage {
	/**
		The {@link firebase.app.App app} associated with the `Storage` service
		instance.
	**/
	var app : firebase.app.App;
	/**
		Returns a reference for the given path in the default bucket.
	**/
	function ref(?path:String):firebase.storage.Reference;
	/**
		Returns a reference for the given absolute URL.
	**/
	function refFromURL(url:String):firebase.storage.Reference;
	/**
		The maximum time to retry operations other than uploads or downloads in
		milliseconds.
	**/
	var maxOperationRetryTime : Float;
	function setMaxOperationRetryTime(time:Float):Void;
	/**
		The maximum time to retry uploads in milliseconds.
	**/
	var maxUploadRetryTime : Float;
	function setMaxUploadRetryTime(time:Float):Void;
}