package firebase.storage;
@:jsRequire("firebase.storage", "FullMetadata") extern interface FullMetadata extends firebase.storage.UploadMetadata {
	/**
		The bucket this object is contained in.
	**/
	var bucket : String;
	/**
		The object's generation.
	**/
	var generation : String;
	/**
		The object's metageneration.
	**/
	var metageneration : String;
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
		The size of this object, in bytes.
	**/
	var size : Float;
	/**
		A date string representing when this object was created.
	**/
	var timeCreated : String;
	/**
		A date string representing when this object was last updated.
	**/
	var updated : String;
	/**
		An array of long-lived download URLs. Always contains at least one URL.
	**/
	var downloadURLs : Array<String>;
	/**
		A Base64-encoded MD5 hash of the object being uploaded.
	**/
	var md5Hash : String;
	/**
		Served as the 'Cache-Control' header on object download.
	**/
	var cacheControl : String;
	/**
		Served as the 'Content-Disposition' header on object download.
	**/
	var contentDisposition : String;
	/**
		Served as the 'Content-Encoding' header on object download.
	**/
	var contentEncoding : String;
	/**
		Served as the 'Content-Language' header on object download.
	**/
	var contentLanguage : String;
	/**
		Served as the 'Content-Type' header on object download.
	**/
	var contentType : String;
	/**
		Additional user-defined custom metadata.
	**/
	var customMetadata : Dynamic<String>;
}