package firebase.firestore;
@:jsRequire("firebase", "firestore.GeoPoint") extern class GeoPoint {
	/**
		The latitude of this GeoPoint instance.
	**/
	var latitude : Float;
	/**
		The longitude of this GeoPoint instance.
	**/
	var longitude : Float;
	/**
		Returns 'true' if this `GeoPoint` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.GeoPoint):Bool;
}