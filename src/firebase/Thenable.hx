package firebase;
extern interface Thenable<T> {
	/**
		Assign callback functions called when the Thenable value either
		resolves, or is rejected.
	**/
	function then(?onResolve:Dynamic, ?onReject:Dynamic):firebase.Thenable<Dynamic>;
	/**
		Assign a callback when the Thenable rejects.
	**/
	@:native("catch")
	function _catch(?onReject:Dynamic):firebase.Thenable<Dynamic>;
}