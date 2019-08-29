package firebase.firestore;
@:jsRequire("firebase", "firestore.QueryDocumentSnapshot") extern class QueryDocumentSnapshot implements firebase.firestore.DocumentSnapshot {
	/**
		Retrieves all fields in the document as an Object.
		
		By default, `FieldValue.serverTimestamp()` values that have not yet been
		set to their final value will be returned as `null`. You can override
		this by passing an options object.
	**/
	function data(?options:firebase.firestore.SnapshotOptions):firebase.firestore.DocumentData;
	/**
		Property of the `DocumentSnapshot` that signals whether or not the data
		exists. True if the document exists.
	**/
	var exists : { };
	/**
		The `DocumentReference` for the document included in the `DocumentSnapshot`.
	**/
	var ref : { };
	/**
		Property of the `DocumentSnapshot` that provides the document's ID.
	**/
	var id : { };
	/**
		Metadata about the `DocumentSnapshot`, including information about its
		 source and local modifications.
	**/
	var metadata : { };
	/**
		Retrieves all fields in the document as an Object. Returns `undefined` if
		the document doesn't exist.
		
		By default, `FieldValue.serverTimestamp()` values that have not yet been
		set to their final value will be returned as `null`. You can override
		this by passing an options object.
	**/
	function data(?options:firebase.firestore.SnapshotOptions):firebase.firestore.DocumentData;
	/**
		Retrieves the field specified by `fieldPath`. Returns `undefined` if the
		document or field doesn't exist.
		
		By default, a `FieldValue.serverTimestamp()` that has not yet been set to
		its final value will be returned as `null`. You can override this by
		passing an options object.
	**/
	function get(fieldPath:haxe.extern.EitherType<firebase.firestore.FieldPath, String>, ?options:firebase.firestore.SnapshotOptions):Dynamic;
	/**
		Returns 'true' if this `DocumentSnapshot` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.DocumentSnapshot):Bool;
}