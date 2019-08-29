package firebase.firestore;
@:jsRequire("firebase", "firestore.GetOptions") extern interface GetOptions {
	/**
		Describes whether a `get()` call in Firestore should return data from the
		server or from the cache.
		
		Setting to `default` (or not setting at all), causes Firestore to try to
		retrieve an up-to-date (server-retrieved) snapshot, but fall back to
		returning cached data if the server can't be reached.
		
		Setting to `server` causes Firestore to avoid the cache, generating an
		error if the server cannot be reached. Note that the cache will still be
		updated if the server request succeeds. Latency-compensation still takes
		effect and any pending write operations will be visible in the
		returned data (merged into the server-provided data).
		
		Setting to `cache` causes Firestore to immediately return a value from the
		cache, bypassing the server completely. The returned value
		may be stale with respect to the value on the server. If there is no cached
		data, `DocumentReference.get()` will return an error and
		`QuerySnapshot.get()` will return an empty `QuerySnapshot`.
	**/
	var source : { };
}