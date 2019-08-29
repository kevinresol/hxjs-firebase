package firebase.INTERNAL;
@:jsRequire("firebase", "INTERNAL.ErrorFactory") extern class ErrorFactory {
	function create(code:String, ?data:Dynamic):firebase.FirebaseError;
}