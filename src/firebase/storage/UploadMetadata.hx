package firebase.storage;
@:jsRequire("firebase.storage", "UploadMetadata") extern interface UploadMetadata extends firebase.storage.SettableMetadata {
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