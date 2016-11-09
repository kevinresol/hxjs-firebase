package firebase.database;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "database.Reference") extern interface Reference extends firebase.database.Query {
	/**
		The last part of the current path.
		
		For example, "ada" is the key for
		https://sample-app.firebaseio.com/users/ada.
		
		The key of the root Reference is `null`.
	**/
	var key : String;
	/**
		Gets a Reference for the location at the specified relative path.
		
		The relative path can either be a simple child name (for example, "ada") or
		a deeper slash-separated path (for example, "ada/name/first").
	**/
	function child(path:String):firebase.database.Reference;
	/**
		The parent location of a Reference.
	**/
	var parent : firebase.database.Reference;
	/**
		The root location of a Reference.
	**/
	var root : firebase.database.Reference;
	/**
		Write data to this database location.
		
		This will overwrite any data at this location and all child locations.
		
		The effect of the write will be visible immediately and the corresponding
		events ('value', 'child_added', etc.) will be triggered. Synchronization of
		the data to the Firebase servers will also be started, and the returned
		Promise will resolve when complete. If provided, the onComplete callback will
		be called asynchronously after synchronization has finished.
		
		Passing `null` for the new value is equivalent to calling remove(); all data at
		this location or any child location will be deleted.
		
		`set()` will remove any priority stored at this location, so if priority is
		meant to be preserved, you should use `setWithPriority()` instead.
		
		Note that modifying data with `set()` will cancel any pending transactions at
		that location, so extreme care should be taken if mixing `set()` and
		`transaction()` to modify the same data.
		
		A single `set()` will generate a single "value" event at the location where the
		`set()` was performed.
	**/
	function set(value:Dynamic, ?onComplete:Dynamic):js.Promise<Dynamic>;
	/**
		Writes multiple values to the database at once.
		
		The `values` argument contains multiple property/value pairs that will be
		written to the database together. Each child property can either be a simple
		property (for example, "name"), or a relative path (for example,
		"name/first") from the current location to the data to update.
		
		As opposed to the `set()` method, `update()` can be use to selectively update
		only the referenced properties at the current location (instead of replacing
		all the child properties at the current location).
		
		The effect of the write will be visible immediately and the corresponding
		events ('value', 'child_added', etc.) will be triggered. Synchronization of
		the data to the Firebase servers will also be started, and the returned
		Promise will resolve when complete. If provided, the onComplete callback will
		be called asynchronously after synchronization has finished.
		
		A single `update()` will generate a single "value" event at the location where
		the `update()` was performed, regardless of how many children were modified.
		
		Note that modifying data with `update()` will cancel any pending transactions
		at that location, so extreme care should be taken if mixing `update()` and
		`transaction()` to modify the same data.
		
		Passing `null` to `update()` will remove the data at this location.
		
		See
		{@link
		 https://firebase.googleblog.com/2015/09/introducing-multi-location-updates-and_86.html
		 Introducing multi-location updates and more}
	**/
	function update(values:Dynamic, ?onComplete:Dynamic):js.Promise<Dynamic>;
	/**
		Writes data the database location. Like `set()` but also specifies the
		priority for that data.
		
		Applications need not use priority, but can order collections by
		ordinary properties (see
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}).
	**/
	function setWithPriority(newVal:Dynamic, newPriority:haxe.extern.EitherType<Float, String>, ?onComplete:Dynamic):js.Promise<Dynamic>;
	/**
		Remove the data at this database location.
		
		Any data at child locations will also be deleted.
		
		The effect of the remove will be visible immediately and the corresponding
		event 'value' will be triggered. Synchronization of the remove to the
		Firebase servers will also be started, and the returned Promise will resolve
		when complete. If provided, the onComplete callback will be called
		asynchronously after synchronization has finished.
	**/
	function remove(?onComplete:Dynamic):js.Promise<Dynamic>;
	/**
		Atomically modifies the data at this location.
		
		Atomically modify the data at this location. Unlike a normal `set()`, which
		just overwrites the data regardless of its previous value, `transaction()` is
		used to modify the existing value to a new value, ensuring there are no
		conflicts with other clients writing to the same location at the same time.
		
		To accomplish this, you pass `transaction()` an update function which is used
		to transform the current value into a new value. If another client writes to
		the location before your new value is successfully written, your update
		function will be called again with the new current value, and the write will
		be retried. This will happen repeatedly until your write succeeds without
		conflict or you abort the transaction by not returning a value from your
		update function.
		
		Note: Modifying data with `set()` will cancel any pending transactions at
		that location, so extreme care should be taken if mixing `set()` and
		`transaction()` to update the same data.
		
		Note: When using transactions with Security and Firebase Rules in place, be
		aware that a client needs `.read` access in addition to `.write` access in
		order to perform a transaction. This is because the client-side nature of
		transactions requires the client to read the data in order to transactionally
		update it.
	**/
	function transaction(transactionUpdate:Dynamic, ?onComplete:Dynamic, ?applyLocally:Bool):js.Promise<{ var committed : Bool; @:optional
	var snapshot : firebase.database.DataSnapshot; }>;
	/**
		Sets a priority for the data at this database location.
		
		Applications need not use priority, but can order collections by
		ordinary properties (see
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}).
	**/
	function setPriority(priority:haxe.extern.EitherType<Float, String>, onComplete:Dynamic):js.Promise<Dynamic>;
	/**
		Generates a new child location using a unique key and returns its reference.
		
		This is the most common pattern for adding data to a collection of items.
		
		If you provide a value to `push()`, the value will be written to the
		generated location. If you don't pass a value, nothing will be written to the
		database and the child will remain empty (but you can use the reference
		elsewhere).
		
		The unique key generated by `push()` are ordered by the current time, so the
		resulting list of items will be chronologically sorted. The keys are also
		designed to be unguessable (they contain 72 random bits of entropy).
		
		
		See
		{@link
		 https://firebase.google.com/docs/database/web/save-data#append_to_a_list_of_data
		 Append to a list of data}
		</br>See
		{@link
		 https://firebase.googleblog.com/2015/02/the-2120-ways-to-ensure-unique_68.html
		 The 2^120 Ways to Ensure Unique Identifiers}
	**/
	function push(?value:Dynamic, ?onComplete:Dynamic):firebase.database.ThenableReference;
	/**
		Returns an `OnDisconnect` object - see
		{@link https://firebase.google.com/docs/database/web/offline-capabilities
		  Offline Capabilities} for information on how to use it.
	**/
	function onDisconnect():firebase.database.OnDisconnect;
	/**
		Returns a `Reference` to the Query's location.
	**/
	var ref : firebase.database.Reference;
	/**
		Returns whether or not the current and provided queries represent the same
		location, have the same query parameters, and are from the same instance of
		`firebase.app.App`.
		
		Two `Reference` objects are equivalent if they represent the same location
		and are from the same instance of `firebase.app.App`.
		
		Two `Query` objects are equivalent if they represent the same location, have
		the same query parameters, and are from the same instance of `firebase.app.App`.
		Equivalent queries share the same sort order, limits, and starting and
		ending points.
	**/
	function isEqual(other:firebase.database.Query):Bool;
	/**
		Listens for data changes at a particular location.
		
		This is the primary way to read data from a database. Your callback
		will be triggered for the initial data and again whenever the data changes.
		Use `off( )` to stop receiving updates. See
		{@link https://firebase.google.com/docs/database/web/retrieve-data Retrieve Data on the Web}
		for more details.
		
		<h4>value event</h4>
		
		This event will trigger once with the initial data stored at this location,
		and then trigger again each time the data changes. The `DataSnapshot` passed to
		the callback will be for the location at which `on()` was called. It won't
		trigger until the entire contents has been synchronized. If the location has
		no data, it will be triggered with an empty `DataSnapshot` (`val()` will return
		`null`).
		
		<h4>child_added event</h4>
		
		This event will be triggered once for each initial child at this location,
		and it will be triggered again every time a new child is added. The
		`DataSnapshot` passed into the callback will reflect the data for the relevant
		child. For ordering purposes, it is passed a second argument which is a
		string containing the key of the previous sibling child by sort order (or
		`null` if it is the first child).
		
		<h4>child_removed event</h4>
		
		This event will be triggered once every time a child is removed. The
		`DataSnapshot` passed into the callback will be the old data for the child that
		was removed. A child will get removed when either:
		
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
		sibling child by sort order (or `null` if it is the first child).
		
		<h4>child_moved event</h4>
		
		This event will be triggered when a child's sort order changes such that its
		position relative to its siblings changes. The `DataSnapshot` passed to the
		callback will be for the data of the child that has moved. It is also passed
		a second argument which is a string containing the key of the previous
		sibling child by sort order (or `null` if it is the first child).
	**/
	function on(eventType:String, callback:Dynamic, ?cancelCallbackOrContext:haxe.extern.EitherType<Dynamic, Dynamic>, ?context:Dynamic):Dynamic;
	/**
		Detaches a callback previously attached with `on()`.
		
		Detach a callback previously attached with `on()`. Note that if `on()` was called
		multiple times with the same eventType and callback, the callback will be
		called multiple times for each event, and `off()` must be called multiple times
		to remove the callback. Calling `off()` on a parent listener will not
		automatically remove listeners registered on child nodes, `off()` must also be
		called on any child listeners to remove the callback.
		
		If a callback is not specified, all callbacks for the specified eventType
		will be removed. Similarly, if no eventType or callback is specified, all
		callbacks for the reference will be removed.
	**/
	function off(?eventType:String, ?callback:Dynamic, ?context:Dynamic):Void;
	/**
		Listens for exactly one event of the specified event type, and then stops listening.
		
		This is equivalent to calling `on()`, and then calling `off()` inside the
		callback function. see `on()` for details on the event types.
	**/
	function once(eventType:String, ?successCallback:Dynamic, ?failureCallbackOrContext:haxe.extern.EitherType<Dynamic, Dynamic>, ?context:Dynamic):js.Promise<Dynamic>;
	/**
		Generates a new Query limited to the first specific number of children.
		
		The `limitToFirst()` method is used to set a maximum number of children to be
		synced for a given callback. If we set a limit of 100, we will initially only
		receive up to 100 `child_added` events. If we have less than 100 messages
		stored in our database, a `child_added` event will fire for each message.
		However, if we have over 100 messages, we will only receive a `child_added`
		event for the first 100 ordered messages. As items change, we will receive
		`child_removed` events for each item that drops out of the active list, so that
		the total number stays at 100.
		
		You can read more about `limitToFirst()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function limitToFirst(limit:Float):firebase.database.Query;
	/**
		Generates a new Query object limited to the last specific number of children.
		
		The `limitToLast()` method is used to set a maximum number of children to be
		synced for a given callback. If we set a limit of 100, we will initially only
		receive up to 100 `child_added` events. If we have less than 100 messages
		stored in our database, a `child_added` event will fire for each message.
		However, if we have over 100 messages, we will only receive a `child_added`
		event for the last 100 ordered messages. As items change, we will receive
		`child_removed` events for each item that drops out of the active list, so that
		the total number stays at 100.
		
		You can read more about `limitToLast()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function limitToLast(limit:Float):firebase.database.Query;
	/**
		Generates a new Query object ordered by the specified child key.
		
		Queries can only order by one key at a time. Calling `orderByChild()` multiple
		times on the same query is an error.
		
		Firebase queries allow you to order your data by any child key, on the fly.
		However, if you know in advance what your indexes will be, you can define
		them via the .indexOn rule in your Security Rules for better performance. See
		the {@link https://firebase.google.com/docs/database/security/indexing-data
		.indexOn} rule for more information.
		
		You can read more about `orderByChild()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function orderByChild(path:String):firebase.database.Query;
	/**
		Generates a new Query object ordered by key.
		
		Sorts the results of a query by their (ascending) key value.
		
		You can read more about `orderByKey()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function orderByKey():firebase.database.Query;
	/**
		Generates a new `Query` object order by priority.
		
		Applications need not use priority, but can order collections by
		ordinary properties (see
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}).
	**/
	function orderByPriority():firebase.database.Query;
	/**
		Generates a new Query object ordered by child values.
		
		If the children of a query are all scalar values (numbers or strings), you
		can order the results by their (ascending) values.
		
		You can read more about `orderByValue()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function orderByValue():firebase.database.Query;
	/**
		Creates a Query with the specified starting point.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows you to choose arbitrary
		starting and ending points for your queries.
		
		The starting point is inclusive, so children with exactly the specified value
		will be included in the query. The optional key argument can be used to
		further limit the range of the query. If it is specified, then children that
		have exactly the specified value must also have a key name greater than or
		equal to the specified key.
		
		You can read more about `startAt()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function startAt(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Creates a Query with the specified ending point.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows you to choose arbitrary
		starting and ending points for your queries.
		
		The ending point is inclusive, so children with exactly the specified value
		will be included in the query. The optional key argument can be used to
		further limit the range of the query. If it is specified, then children that
		have exactly the specified value must also have a key name less than or equal
		to the specified key.
		
		You can read more about `endAt()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function endAt(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Creates a Query which includes children which match the specified value.
		
		Using `startAt()`, `endAt()`, and `equalTo()` allows us to choose arbitrary
		starting and ending points for our queries.
		
		The optional key argument can be used to further limit the range of the
		query. If it is specified, then children that have exactly the specified
		value must also have exactly the specified key as their key name. This can be
		used to filter result sets with many matches for the same value.
		
		You can read more about `equalTo()` in
		{@link
		 https://firebase.google.com/docs/database/web/lists-of-data#sorting_and_filtering_data
		 Sorting and filtering data}.
	**/
	function equalTo(value:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Float>>, ?key:String):firebase.database.Query;
	/**
		Get the absolute URL for this location.
		
		The `toString()` method returns a URL that is ready to be put into a browser,
		curl command, or a `firebase.database().refFromURL()` call. Since all of those
		expect the URL to be url-encoded, `toString()` returns an encoded URL.
		
		Append '.json' to the URL when typed into a browser to download JSON
		formatted data. If the location is secured (not publicly readable) you will
		get a permission-denied error.
	**/
	function toString():String;
}