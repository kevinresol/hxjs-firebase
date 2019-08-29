package firebase.firestore;
@:jsRequire("firebase", "firestore.FieldPath") extern class FieldPath {
	/**
		Returns a special sentinel `FieldPath` to refer to the ID of a document.
		It can be used in queries to sort or filter by the document ID.
	**/
	static function documentId():firebase.firestore.FieldPath;
	/**
		Returns 'true' if this `FieldPath` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.FieldPath):Bool;
}