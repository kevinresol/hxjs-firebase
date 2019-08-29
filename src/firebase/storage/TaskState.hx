package firebase.storage;
@:jsRequire("firebase", "storage.TaskState") @:enum extern abstract TaskState(String) {
	/**
		Indicates that the task is still running and making progress.
	**/
	var RUNNING;
	/**
		Indicates that the task is paused.
	**/
	var PAUSED;
	/**
		Indicates that the task completed successfully.
	**/
	var SUCCESS;
	/**
		Indicates that the task was canceled.
	**/
	var CANCELED;
	/**
		Indicates that the task failed for a reason other than being canceled.
	**/
	var ERROR;
}