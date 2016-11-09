package firebase.storage;
@:jsRequire("firebase", "storage.SettableMetadata") extern interface SettableMetadata {
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