package firebase;
extern class Promise<T> implements firebase.Thenable<T> {
	/**
		Assign callback functions called when the Promise either resolves, or is
		rejected.
	**/
	function then(?onResolve:Dynamic, ?onReject:Dynamic):firebase.Promise<Dynamic>;
	/**
		Assign a callback when the Promise rejects.
	**/
	@:native("catch")
	function _catch(?onReject:Dynamic):firebase.Thenable<Dynamic>;
	/**
		Return a resolved Promise.
	**/
	static function resolve(?value:Dynamic):firebase.Promise<Dynamic>;
	/**
		Return (an immediately) rejected Promise.
	**/
	static function reject(error:js.Error):firebase.Promise<Dynamic>;
	/**
		Convert an array of Promises, to a single array of values.
		<code>Promise.all()</code> resolves only after all the Promises in the array
		have resolved.
		
		<code>Promise.all()</code> rejects when any of the promises in the Array have
		rejected.
	**/
	static function all(values:Array<firebase.Promise<Dynamic>>):firebase.Promise<Array<Dynamic>>;
}