package firebase.firestore;
@:jsRequire("firebase", "firestore.Blob") extern interface Blob {
	/**
		Returns 'true' if this `Blob` is equal to the provided one.
	**/
	function isEqual(other:firebase.firestore.Blob):Bool;
	/**
		Creates a new Blob from the given Base64 string, converting it to bytes.
	**/
	static function fromBase64String(base64:String):firebase.firestore.Blob;
	/**
		Creates a new Blob from the given Uint8Array.
	**/
	static function fromUint8Array(array:js.html.Uint8Array):firebase.firestore.Blob;
	/**
		Returns the bytes of a Blob as a Base64-encoded string.
	**/
	function toBase64():String;
	/**
		Returns the bytes of a Blob in a new Uint8Array.
	**/
	function toUint8Array():js.html.Uint8Array;
}