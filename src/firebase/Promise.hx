package firebase;
@:jsRequire("firebase", "Promise") extern class Promise<T> implements firebase.Thenable<T> {
	/**
		Assign callback functions called when the Promise either resolves, or is
		rejected.
	**/
	function then(?onResolve:T, ?onReject:js.Error):firebase.Promise<T>;
	/**
		Assign a callback when the Promise rejects.
	**/
	@:native("catch")
	function catch_(?onReject:js.Error):firebase.Promise<T>;
	/**
		Return a resolved Promise.
	**/
	static function resolve<T>(?value:T):firebase.Promise<T>;
	/**
		Return (an immediately) rejected Promise.
	**/
	static function reject<T>(error:js.Error):firebase.Promise<T>;
	/**
		Convert an array of Promises, to a single array of values.
		<code>Promise.all()</code> resolves only after all the Promises in the array
		have resolved.
		
		<code>Promise.all()</code> rejects when any of the promises in the Array have
		rejected.
	**/
	static function all<T>(values:Array<firebase.Promise<T>>):firebase.Promise<Array<T>>;
}