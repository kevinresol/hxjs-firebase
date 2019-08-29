package firebase.firestore;
@:jsRequire("firebase", "firestore.SnapshotListenOptions") extern interface SnapshotListenOptions {
	/**
		Raise an event even if only metadata of the query or document
		changes. Default is false.
	**/
	var includeMetadataChanges : { };
}