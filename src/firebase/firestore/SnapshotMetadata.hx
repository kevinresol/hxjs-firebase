package firebase.firestore;
@:jsRequire("firebase", "firestore.SnapshotMetadata") extern interface SnapshotMetadata {
	/**
		True if the snapshot was created from cached data rather than guaranteed
		up-to-date server data. If your listener has opted into metadata updates
		(via `SnapshotListenOptions`)
		you will receive another snapshot with `fromCache` set to false once
		the client has received up-to-date data from the backend.
	**/
	var fromCache : { };
	/**
		True if the snapshot includes local writes (`set()` or
		`update()` calls) that haven't been committed to the backend yet.
		
		If your listener has opted into metadata updates via
		`SnapshotListenOptions`, you receive another
		snapshot with `hasPendingWrites` set to false once the writes have been
		committed to the backend.
	**/
	var hasPendingWrites : { };
	/**
		Returns 'true' if this `SnapshotMetadata` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.SnapshotMetadata):Bool;
}