package firebase;
@:jsRequire("firebase", "Thenable") extern interface Thenable<T> {
	/**
		Assign callback functions called when the Thenable value either
		resolves, or is rejected.
	**/
	function then(?onResolve:T, ?onReject:js.Error):firebase.Thenable<T>;
	/**
		Assign a callback when the Thenable rejects.
	**/
	@:native("catch")
	function catch_(?onReject:js.Error):firebase.Thenable<T>;
}