package firebase.firestore;
@:jsRequire("firebase", "firestore.SetOptions") extern interface SetOptions {
	/**
		Changes the behavior of a set() call to only replace the values specified
		in its data argument. Fields omitted from the set() call remain untouched.
	**/
	var merge : { };
	/**
		Changes the behavior of set() calls to only replace the specified field
		paths. Any field path that is not specified is ignored and remains
		untouched.
	**/
	var mergeFields : { };
}