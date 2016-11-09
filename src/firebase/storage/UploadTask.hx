package firebase.storage;
@:jsRequire("firebase", "storage.UploadTask") extern interface UploadTask {
	/**
		This object behaves like a Promise, and resolves with its snapshot data when
		the upload completes.
	**/
	function then(?onFulfilled:Dynamic, ?onRejected:Dynamic):js.Promise<Dynamic>;
	/**
		Equivalent to calling `then(null, onRejected)`.
	**/
	@:native("catch")
	function catch_(onRejected:Dynamic):js.Promise<Dynamic>;
	/**
		Listens for events on this task.
		
		Events have three callback functions (referred to as `next`, `error`, and
		`complete`).
		
		If only the event is passed, a function that can be used to register the
		callbacks is returned. Otherwise, the callbacks are passed after the event.
		
		Callbacks can be passed either as three separate arguments <em>or</em> as the
		`next`, `error`, and `complete` properties of an object. Any of the three
		callbacks is optional, as long as at least one is specified. In addition,
		when you add your callbacks, you get a function back. You can call this
		function to unregister the associated callbacks.
	**/
	function on(event:firebase.storage.TaskEvent, ?nextOrObserver:haxe.extern.EitherType<Dynamic, Dynamic>, ?error:Dynamic, ?complete:Dynamic):haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		Resumes a paused task. Has no effect on a running or failed task.
	**/
	function resume():Bool;
	/**
		Pauses a running task. Has no effect on a paused or failed task.
	**/
	function pause():Bool;
	/**
		Cancels a running task. Has no effect on a complete or failed task.
	**/
	function cancel():Bool;
	/**
		A snapshot of the current task state.
	**/
	var snapshot : firebase.storage.UploadTaskSnapshot;
}