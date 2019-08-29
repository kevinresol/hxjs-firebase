package firebase.firestore;
@:jsRequire("firebase", "firestore.Transaction") extern interface Transaction {
	/**
		Reads the document referenced by the provided `DocumentReference.`
	**/
	function get(documentRef:firebase.firestore.DocumentReference):js.Promise<firebase.firestore.DocumentSnapshot>;
	/**
		Writes to the document referred to by the provided `DocumentReference`.
		If the document does not exist yet, it will be created. If you pass
		options, the provided data can be merged into the existing document.
	**/
	function set(documentRef:firebase.firestore.DocumentReference, data:Dynamic, ?options:firebase.firestore.SetOptions):firebase.firestore.Transaction;
	/**
		Updates fields in the document referred to by this `DocumentReference`.
		The update will fail if applied to a document that does not exist.
		
		Nested fields can be updated by providing dot-separated field path strings
		or by providing FieldPath objects.
	**/
	function update(documentRef:firebase.firestore.DocumentReference, var_args:Dynamic):firebase.firestore.Transaction;
	/**
		Deletes the document referred to by the provided `DocumentReference`.
	**/
	function delete(documentRef:firebase.firestore.DocumentReference):firebase.firestore.Transaction;
}