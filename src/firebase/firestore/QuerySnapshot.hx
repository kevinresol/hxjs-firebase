package firebase.firestore;
@:jsRequire("firebase", "firestore.QuerySnapshot") extern interface QuerySnapshot {
	/**
		The query you called `get` or `onSnapshot` on to get the `QuerySnapshot`.
	**/
	var query : firebase.firestore.Query;
	/**
		Metadata about this snapshot, concerning its source and if it has local
		modifications.
	**/
	var metadata : firebase.firestore.SnapshotMetadata;
	/**
		Returns an array of the document changes since the last snapshot. If this
		is the first snapshot, all documents will be in the list as "added" changes.
	**/
	function docChanges(?options:firebase.firestore.SnapshotOptions):Void;
	/**
		An array of all the documents in the `QuerySnapshot`.
	**/
	var docs : Array<firebase.firestore.QueryDocumentSnapshot>;
	/**
		The number of documents in the `QuerySnapshot`.
	**/
	var size : Float;
	/**
		True if there are no documents in the `QuerySnapshot`.
	**/
	var empty : Bool;
	/**
		Enumerates all of the documents in the `QuerySnapshot`.
	**/
	function forEach(callback:haxe.Constraints.Function, ?thisArg:Dynamic):Void;
	/**
		Returns 'true' if this `QuerySnapshot` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.QuerySnapshot):Bool;
}