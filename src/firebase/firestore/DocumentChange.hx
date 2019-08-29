package firebase.firestore;
@:jsRequire("firebase", "firestore.DocumentChange") extern interface DocumentChange {
	/**
		The type of change that occurred.
		
		Possible values are 'added', 'modified', or 'removed'.
	**/
	var type : String;
	/**
		The document affected by this change.
	**/
	var doc : firebase.firestore.QueryDocumentSnapshot;
	/**
		The index of the changed document in the result set immediately prior to
		this `DocumentChange` (i.e. supposing that all prior `DocumentChange` objects
		have been applied). Is -1 for 'added' events.
	**/
	var oldIndex : Float;
	/**
		The index of the changed document in the result set immediately after
		this `DocumentChange` (i.e. supposing that all prior `DocumentChange`
		objects and the current `DocumentChange` object have been applied).
		Is -1 for 'removed' events.
	**/
	var newIndex : Float;
}