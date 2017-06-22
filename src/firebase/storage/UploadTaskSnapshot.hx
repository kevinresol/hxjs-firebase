package firebase.storage;
@:jsRequire("firebase", "storage.UploadTaskSnapshot") extern interface UploadTaskSnapshot {
	/**
		The number of bytes that have been successfully uploaded so far.
	**/
	var bytesTransferred : Float;
	/**
		The total number of bytes to be uploaded.
	**/
	var totalBytes : Float;
	/**
		The current state of the task.
	**/
	var state : firebase.storage.TaskState;
	/**
		Before the upload completes, contains the metadata sent to the server.
		After the upload completes, contains the metadata sent back from the server.
	**/
	var metadata : firebase.storage.FullMetadata;
	/**
		After the upload completes, contains a long-lived download URL for the
		object. Also accessible in metadata.
	**/
	var downloadURL : String;
	/**
		The task of which this is a snapshot.
	**/
	var task : firebase.storage.UploadTask;
	/**
		The reference that spawned this snapshot's upload task.
	**/
	var ref : firebase.storage.Reference;
}