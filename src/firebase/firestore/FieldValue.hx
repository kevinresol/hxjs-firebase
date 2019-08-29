package firebase.firestore;
@:jsRequire("firebase", "firestore.FieldValue") extern interface FieldValue {
	/**
		Returns a sentinel used with `set()` or `update()` to include a
		server-generated timestamp in the written data.
	**/
	static function serverTimestamp():firebase.firestore.FieldValue;
	/**
		Returns a sentinel for use with `update()` to mark a field for deletion.
	**/
	static function delete():firebase.firestore.FieldValue;
	/**
		Returns 'true' if this `FieldValue` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.FieldValue):Bool;
}