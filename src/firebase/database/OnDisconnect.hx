package firebase.database;
@:jsRequire("firebase.database", "OnDisconnect") extern interface OnDisconnect {
	/**
		Cancels all previously queued `onDisconnect()` set or update events for this
		location and all children.
		
		If a write has been queued for this location via a `set()` or `update()` at a
		parent location, the write at this location will be canceled though all other
		siblings will still be written.
	**/
	function cancel(?onComplete:Dynamic):firebase.Promise<Dynamic>;
	/**
		Ensures the data at this location is deleted when the client is disconnected
		(due to closing the browser, navigating to a new page, or network issues).
	**/
	function remove(?onComplete:Dynamic):firebase.Promise<Dynamic>;
	/**
		Ensures the data at this location is set to the specified value when the
		client is disconnected (due to closing the browser, navigating to a new page,
		or network issues).
		
		Ensure the data at this location is set to the specified value when the
		client is disconnected (due to closing the browser, navigating to a new page,
		or network issues).
		
		`set()` is especially useful for implementing "presence" systems, where a value
		should be changed or cleared when a user disconnects so that he appears
		"offline" to other users. See
		{@link https://firebase.google.com/docs/database/web/offline-capabilities
		 Offline Capabilities} for more information.
		
		Note that `onDisconnect` operations are only triggered once. If you want an
		operation to occur each time a disconnect occurs, you'll need to re-establish
		the `onDisconnect` operations each time.
	**/
	function set(value:Dynamic, ?onComplete:Dynamic):firebase.Promise<Dynamic>;
	/**
		Ensures the data at this location is set to the specified value and priority
		when the client is disconnected (due to closing the browser, navigating to a
		new page, or network issues).
		
		Applications need not use priority, but can order collections by
		ordinary properties (see
		{@link
		 https://firebase.google.com/docs/database/web/retrieve-data#sorting_and_filtering_data
		 Sorting and filtering data}).
	**/
	function setWithPriority(value:Dynamic, priority:haxe.extern.EitherType<String, Float>, ?onComplete:Dynamic):firebase.Promise<Dynamic>;
	/**
		Writes multiple values this location when the client is disconnected (due to
		closing the browser, navigating to a new page, or network issues).
		
		The `values` argument contains multiple property/value pairs that will be
		written to the database together. Each child property can either be a simple
		property (for example, "name"), or a relative path (for example,
		"name/first") from the current location to the data to update.
		
		As opposed to the `set()` method, `update()` can be use to selectively update
		only the referenced properties at the current location (instead of replacing
		all the child properties at the current location).
		
		See {@link firebase.database.Reference#update} for examples of using
		the connected version of `update`.
	**/
	function update(values:Dynamic, ?onComplete:Dynamic):firebase.Promise<Dynamic>;
}