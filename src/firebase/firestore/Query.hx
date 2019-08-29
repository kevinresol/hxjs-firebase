package firebase.firestore;
@:jsRequire("firebase", "firestore.Query") extern class Query {
	/**
		The `Firestore` for the Cloud Firestore database (useful for performing
		transactions, etc.).
	**/
	var firestore : firebase.firestore.Firestore;
	/**
		Creates a new query that returns only documents that include the specified
		fields and where the values satisfy the constraints provided.
	**/
	function where(fieldPath:haxe.extern.EitherType<firebase.firestore.FieldPath, String>, opStr:String, value:Dynamic):firebase.firestore.Query;
	/**
		Creates a new query where the results are sorted by the
		specified field, in descendin or ascending order.
	**/
	function orderBy(fieldPath:haxe.extern.EitherType<firebase.firestore.FieldPath, String>, ?directionStr:String):firebase.firestore.Query;
	/**
		Creates a new query where the results are limited to the specified number of
		documents.
	**/
	function limit(limit:Float):firebase.firestore.Query;
	/**
		Creates a new query where the results start at the provided document
		(inclusive). The starting position is relative to the order of the query.
		The document must contain all of the fields provided in the `orderBy` of
		the query.
	**/
	function startAt(snapshotOrVarArgs:Dynamic):firebase.firestore.Query;
	/**
		Creates a new query where the results start after the provided document
		(exclusive). The starting position is relative to the order of the query.
		The document must contain all of the fields provided in the `orderBy` of
		this query.
	**/
	function startAfter(snapshotOrVarArgs:Dynamic):firebase.firestore.Query;
	/**
		Creates a new query where the results end before the provided document
		(exclusive). The end position is relative to the order of the query. The
		document must contain all of the fields provided in the `orderBy` of this
		query.
	**/
	function endBefore(snapshotOrVarArgs:Dynamic):firebase.firestore.Query;
	/**
		Creates a new query where the results end at the provided document
		(inclusive). The end position is relative to the order of the query. The
		document must contain all of the fields provided in the `orderBy` of this
		query.
	**/
	function endAt(snapshotOrVarArgs:Dynamic):firebase.firestore.Query;
	/**
		Executes the query and returns the results as a `QuerySnapshot`.
	**/
	function get(?options:firebase.firestore.GetOptions):firebase.firestore.QuerySnapshot;
	/**
		Attaches a listener for `QuerySnapshot` events. You may either pass
		individual `onNext` and `onError` callbacks or pass a single observer
		object with `next` and `error` callbacks. The listener can be cancelled by
		calling the function that is returned when `onSnapshot` is called.
		
		NOTE: Although an `onCompletion` callback can be provided, it will
		never be called because the snapshot stream is never-ending.
	**/
	function onSnapshot(optionsOrObserverOrOnNext:haxe.extern.EitherType<haxe.Constraints.Function, haxe.extern.EitherType<Dynamic, firebase.firestore.SnapshotListenOptions>>, observerOrOnNextOrOnError:haxe.extern.EitherType<haxe.Constraints.Function, haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>>, ?onError:haxe.Constraints.Function):haxe.Constraints.Function;
}