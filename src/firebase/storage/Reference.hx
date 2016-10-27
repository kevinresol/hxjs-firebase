package firebase.storage;
@:jsRequire("firebase.storage", "Reference") extern interface Reference {
	/**
		Returns a gs:// URL for this object in the form
		  `gs://<bucket>/<path>/<to>/<object>`
	**/
	function toString():String;
	/**
		Returns a reference to a relative path from this reference.
	**/
	function child(path:String):firebase.storage.Reference;
	/**
		Uploads data to this reference's location.
	**/
	function put(data:haxe.extern.EitherType<js.html.ArrayBuffer, haxe.extern.EitherType<js.html.Uint8Array, js.html.Blob>>, ?metadata:firebase.storage.UploadMetadata):firebase.storage.UploadTask;
	/**
		Uploads string data to this reference's location.
	**/
	function putString(data:String, ?format:firebase.storage.StringFormat, ?metadata:firebase.storage.UploadMetadata):firebase.storage.UploadTask;
	/**
		Deletes the object at this reference's location.
	**/
	function delete():js.Promise<Dynamic>;
	/**
		Fetches metadata for the object at this location, if one exists.
	**/
	function getMetadata():js.Promise<firebase.storage.FullMetadata>;
	/**
		Updates the metadata for the object at this location, if one exists.
	**/
	function updateMetadata(metadata:firebase.storage.SettableMetadata):js.Promise<firebase.storage.FullMetadata>;
	/**
		Fetches a long lived download URL for this object.
	**/
	function getDownloadURL():js.Promise<String>;
	/**
		A reference pointing to the parent location of this reference, or null if
		this reference is the root.
	**/
	var parent : firebase.storage.Reference;
	/**
		A reference to the root of this reference's bucket.
	**/
	var root : firebase.storage.Reference;
	/**
		The name of the bucket containing this reference's object.
	**/
	var bucket : String;
	/**
		The full path of this object.
	**/
	var fullPath : String;
	/**
		The short name of this object, which is the last component of the full path.
		For example, if fullPath is 'full/path/image.png', name is 'image.png'.
	**/
	var name : String;
	/**
		The storage service associated with this reference.
	**/
	var storage : firebase.storage.Storage;
}