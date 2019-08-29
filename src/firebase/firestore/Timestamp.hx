package firebase.firestore;
@:jsRequire("firebase", "firestore.Timestamp") extern class Timestamp {
	/**
		Get the current time as a Timestamp object.
	**/
	static function now():firebase.firestore.Timestamp;
	/**
		Creates a new timestamp from the given date.
	**/
	static function fromDate(date:Dynamic):firebase.firestore.Timestamp;
	/**
		Creates a new timestamp from the given number of milliseconds.
	**/
	static function fromMillis(milliseconds:Float):firebase.firestore.Timestamp;
	/**
		Convert a Timestamp to a JavaScript `Date` object. This conversion causes
		a loss of precision since `Date` objects only support millisecond precision.
	**/
	function toDate():Dynamic;
	/**
		Convert a timestamp to a numeric timestamp (in milliseconds since epoch).
		This operation causes a loss of precision.
	**/
	function toMillis():Float;
}