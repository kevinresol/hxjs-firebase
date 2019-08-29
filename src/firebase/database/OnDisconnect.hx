package firebase.database;
@:jsRequire("firebase", "database.OnDisconnect") extern interface OnDisconnect {
	/**
		Cancels all previously queued `onDisconnect()` set or update events for this
		location and all children.
		
		If a write has been queued for this location via a `set()` or `update()` at a
		parent location, the write at this location will be canceled, though writes
		to sibling locations will still occur.
	**/
	function cancel(?onComplete:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Ensures the data at this location is deleted when the client is disconnected
		(due to closing the browser, navigating to a new page, or network issues).
	**/
	function remove(?onComplete:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Ensures the data at this location is set to the specified value when the
		client is disconnected (due to closing the browser, navigating to a new page,
		or network issues).
		
		`set()` is especially useful for implementing "presence" systems, where a
		value should be changed or cleared when a user disconnects so that they
		appear "offline" to other users. See
		{@link
		  https://firebase.google.com/docs/database/web/offline-capabilities
		  Enabling Offline Capabilities in JavaScript} for more information.
		
		Note that `onDisconnect` operations are only triggered once. If you want an
		operation to occur each time a disconnect occurs, you'll need to re-establish
		the `onDisconnect` operations each time.
	**/
	function set(value:Dynamic, ?onComplete:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Ensures the data at this location is set to the specified value and priority
		when the client is disconnected (due to closing the browser, navigating to a
		new page, or network issues).
	**/
	function setWithPriority(value:Dynamic, priority:haxe.extern.EitherType<String, Float>, ?onComplete:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Writes multiple values at this location when the client is disconnected (due
		to closing the browser, navigating to a new page, or network issues).
		
		The `values` argument contains multiple property-value pairs that will be
		written to the Database together. Each child property can either be a simple
		property (for example, "name") or a relative path (for example, "name/first")
		from the current location to the data to update.
		
		As opposed to the `set()` method, `update()` can be use to selectively update
		only the referenced properties at the current location (instead of replacing
		all the child properties at the current location).
		
		See more examples using the connected version of
		{@link firebase.database.Reference#update `update()`}.
	**/
	function update(values:Dynamic, ?onComplete:haxe.Constraints.Function):js.Promise<Dynamic>;
}