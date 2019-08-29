package firebase.database;
@:jsRequire("firebase", "database.Query") extern interface Query {
	/**
		Returns a `Reference` to the `Query`'s location.
	**/
	var ref : firebase.database.Reference;
	/**
		Returns whether or not the current and provided queries represent the same
		location, have the same query parameters, and are from the same instance of
		`firebase.app.App`.
		
		Two `Reference` objects are equivalent if they represent the same location
		and are from the same instance of `firebase.app.App`.
		
		Two `Query` objects are equivalent if they represent the same location, have
		the same query parameters, and are from the same instance of
		`firebase.app.App`. Equivalent queries share the same sort order, limits, and
		starting and ending points.
	**/
	function isEqual(other:firebase.database.Query):Bool;
	/**
		Listens for data changes at a particular location.
		
		This is the primary way to read data from a Database. Your callback
		will be triggered for the initial data and again whenever the data changes.
		Use `off( )` to stop receiving updates. See
		{@link https://firebase.google.com/docs/database/web/retrieve-data
		  Retrieve Data on the Web}
		for more details.
		
		<h4>value event</h4>
		
		This event will trigger once with the initial data stored at this location,
		and then trigger again each time the data changes. The `DataSnapshot` passed
		to the callback will be for the location at which `on()` was called. It
		won't trigger until the entire contents has been synchronized. If the
		location has no data, it will be triggered with an empty `DataSnapshot`
		(`val()` will return `null`).
		
		<h4>child_added event</h4>
		
		This event will be triggered once for each initial child at this location,
		and it will be triggered again every time a new child is added. The
		`DataSnapshot` passed into the callback will reflect the data for the
		relevant child. For ordering purposes, it is passed a second argument which
		is a string containing the key of the previous sibling child by sort order,
		or `null` if it is the first child.
		
		<h4>child_removed event</h4>
		
		This event will be triggered once every time a child is removed. The
		`DataSnapshot` passed into the callback will be the old data for the child
		that was removed. A child will get removed when either:
		
		- a client explicitly calls `remove()` on that child or one of its ancestors
		- a client calls `set(null)` on that child or one of its ancestors
		- that child has all of its children removed
		- there is a query in effect which now filters out the child (because it's
		  sort order changed or the max limit was hit)
		
		<h4>child_changed event</h4>
		
		This event will be triggered when the data stored in a child (or any of its
		descendants) changes. Note that a single `child_changed` event may represent
		multiple changes to the child. The `DataSnapshot` passed to the callback will
		contain the new child contents. For ordering purposes, the callback is also
		passed a second argument which is a string containing the key of the previous
		sibling child by sort order, or `null` if it is the first child.
		
		<h4>child_moved event</h4>
		
		This event will be triggered when a child's sort order changes such that its
		position relative to its siblings changes. The `DataSnapshot` passed to the
		callback will be for the data of the child that has moved. It is also passed
		a second argument which is a string containing the key of the previous
		sibling child by sort order, or `null` if it is the first child.
	**/
	function on(eventType:String, callback:haxe.Constraints.Function, ?cancelCallbackOrContext:haxe.extern.EitherType<Dynamic, haxe.Constraints.Function>, ?context:Dynamic):haxe.Constraints.Function;
	/**
		Detaches a callback previously attached with `on()`.
		
		Detach a callback previously attached with `on()`. Note that if `on()` was
		called multiple times with the same eventType and callback, the callback
		will be called multiple times for each event, and `off()` must be called
		multiple times to remove the callback. Calling `off()` on a parent listener
		will not automatically remove listeners registered on child nodes, `off()`
		must also be called on any child listeners to remove the callback.
		
		If a callback is not specified, all callbacks for the specified eventType
		will be removed. Similarly, if no eventType or callback is specified, all
		callbacks for the `Reference` will be removed.
	**/
	function off(?eventType:String, ?callback:haxe.Constraints.Function, ?context:Dynamic):Void;
	/**
		Listens for exactly one event of the specified event type, and then stops
		listening.
		
		This is equivalent to calling {@link firebase.database.Query#on `on()`}, and
		then calling {@link firebase.database.Query#off `off()`} inside the callback
		function. See {@link firebase.database.Query#on `on()`} for details on the
		event types.
	**/
	function once(eventType:String, ?successCallback:haxe.Constraints.Function, ?failureCallbackOrContext:haxe.extern.EitherType<Dynamic, haxe.Constraints.Function>, ?context:Dynamic):js.Promise<Dynamic>;
	/**
		Generates a new `Query` limited to the first specific number of children.
		
		The `limitToFirst()` method is used to set a maximum number of children to be
		synced for a given callback. If we set a limit of 100, we will initially only
		receive up to 100 `child_added` events. If we have fewer than 100 messages
		stored in our Database, a `child_added` event will fire for each message.
		However, if we have over 100 messages, we will only receive a `child_added`
		event for the first 100 ordered messages. As items change, we will receive
		`child_removed` events for each item that drops out of the active list so
		that the total number stays at 100.
		
		You can read more about `limitToFirst()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#filtering_data
		 Filtering data}.
	**/
	function limitToFirst(limit:Float):firebase.database.Query;
	/**
		Generates a new `Query` object limited to the last specific number of
		children.
		
		The `limitToLast()` method is used to set a maximum number of children to be
		synced for a given callback. If we set a limit of 100, we will initially only
		receive up to 100 `child_added` events. If we have fewer than 100 messages
		stored in our Database, a `child_added` event will fire for each message.
		However, if we have over 100 messages, we will only receive a `child_added`
		event for the last 100 ordered messages. As items change, we will receive
		`child_removed` events for each item that drops out of the active list so
		that the total number stays at 100.
		
		You can read more about `limitToLast()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#filtering_data
		 Filtering data}.
	**/
	function limitToLast(limit:Float):firebase.database.Query;
	/**
		Generates a new `Query` object ordered by the specified child key.
		
		Queries can only order by one key at a time. Calling `orderByChild()`
		multiple times on the same query is an error.
		
		Firebase queries allow you to order your data by any child key on the fly.
		However, if you know in advance what your indexes will be, you can define
		them via the .indexOn rule in your Security Rules for better performance. See
		the {@link https://firebase.google.com/docs/database/security/indexing-data
		.indexOn} rule for more information.
		
		You can read more about `orderByChild()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sort_data
		 Sort data}.
	**/
	function orderByChild(path:String):firebase.database.Query;
	/**
		Generates a new `Query` object ordered by key.
		
		Sorts the results of a query by their (ascending) key values.
		
		You can read more about `orderByKey()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sort_data
		 Sort data}.
	**/
	function orderByKey():firebase.database.Query;
	/**
		Generates a new `Query` object ordered by priority.
		
		Applications need not use priority but can order collections by
		ordinary properties (see
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sort_data
		 Sort data} for alternatives to priority.
	**/
	function orderByPriority():firebase.database.Query;
	/**
		Generates a new `Query` object ordered by value.
		
		If the children of a query are all scalar values (string, number, or
		boolean), you can order the results by their (ascending) values.
		
		You can read more about `orderByValue()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sort_data
		 Sort data}.
	**/
	function orderByValue():firebase.database.Query;
	/**
		Creates a `Query` with the specified starting point.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows you to choose arbitrary
		starting and ending points for your queries.
		
		The starting point is inclusive, so children with exactly the specified value
		will be included in the query. The optional key argument can be used to
		further limit the range of the query. If it is specified, then children that
		have exactly the specified value must also have a key name greater than or
		equal to the specified key.
		
		You can read more about `startAt()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#filtering_data
		 Filtering data}.
	**/
	function startAt(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Creates a `Query` with the specified ending point.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows you to choose arbitrary
		starting and ending points for your queries.
		
		The ending point is inclusive, so children with exactly the specified value
		will be included in the query. The optional key argument can be used to
		further limit the range of the query. If it is specified, then children that
		have exactly the specified value must also have a key name less than or equal
		to the specified key.
		
		You can read more about `endAt()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#filtering_data
		 Filtering data}.
	**/
	function endAt(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Creates a `Query` that includes children that match the specified value.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows us to choose arbitrary
		starting and ending points for our queries.
		
		The optional key argument can be used to further limit the range of the
		query. If it is specified, then children that have exactly the specified
		value must also have exactly the specified key as their key name. This can be
		used to filter result sets with many matches for the same value.
		
		You can read more about `equalTo()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#filtering_data
		 Filtering data}.
	**/
	function equalTo(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Gets the absolute URL for this location.
		
		The `toString()` method returns a URL that is ready to be put into a browser,
		curl command, or a `firebase.database().refFromURL()` call. Since all of
		those expect the URL to be url-encoded, `toString()` returns an encoded URL.
		
		Append '.json' to the returned URL when typed into a browser to download
		JSON-formatted data. If the location is secured (that is, not publicly
		readable), you will get a permission-denied error.
	**/
	function toString():String;
	/**
		Returns a JSON-serializable representation of this object.
	**/
	function toJSON():Dynamic;
}