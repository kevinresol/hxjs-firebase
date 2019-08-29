package firebase.firestore;
@:jsRequire("firebase", "firestore.Settings") extern interface Settings {
	/**
		Enables the use of `Timestamps` for timestamp fields in `DocumentSnapshots`.
		
		Currently, Firestore returns timestamp fields as `Date` but `Date` only
		supports millisecond precision, which leads to truncation and causes
		unexpected behavior when using a timestamp from a snapshot as a part
		of a subsequent query.
		
		Setting `timestampsInSnapshots` to `true` will cause Firestore to return
		`Timestamp` values instead of `Date`, which avoids truncation. Note that you
		must also change any code that uses `Date` to use `Timestamp` instead.
		
		WARNING: In the future, `timestampsInSnapshots: true` will become the
		default and this option will be removed. You should change your code to
		use `Timestamp` and opt-in to this new behavior as soon as you can.
	**/
	var timestampsInSnapshots : { };
}