package firebase.firestore;
@:jsRequire("firebase", "firestore.DocumentReference") extern interface DocumentReference {
	/**
		The document's identifier within its collection.
	**/
	var id : String;
	/**
		The {@link firebase.firestore.Firestore} the document is in.
		This is useful for performing transactions, for example.
	**/
	var firestore : firebase.firestore.Firestore;
	/**
		The Collection this `DocumentReference` belongs to.
	**/
	var parent : firebase.firestore.CollectionReference;
	/**
		Gets a `CollectionReference` instance that refers to the collection at
		the specified path.
	**/
	function collection(collectionPath:String):firebase.firestore.CollectionReference;
	/**
		Writes to the document referred to by this `DocumentReference`.
		If the document does not exist yet, it will be created. If you pass
		options, the provided data can be merged into the existing document.
	**/
	function set(data:Dynamic, ?options:firebase.firestore.SetOptions):js.Promise<Dynamic>;
	/**
		Updates fields in the document referred to by this `DocumentReference`.
		The update will fail if applied to a document that does not exist.
		
		Nested fields can be updated by providing dot-separated field path strings
		or by providing FieldPath objects.
	**/
	function update(var_args:Dynamic):js.Promise<Dynamic>;
	/**
		Deletes the document referred to by this `DocumentReference`.
	**/
	function delete():js.Promise<Dynamic>;
	/**
		Reads the document referred to by this `DocumentReference`.
	**/
	function get(?options:firebase.firestore.GetOptions):js.Promise<firebase.firestore.DocumentSnapshot>;
	/**
		Attaches a listener for DocumentSnapshot events. You may either pass
		individual `onNext` and `onError` callbacks or pass a single `observer`
		object with `next` and `error` callbacks. The listener can be cancelled by
		calling the function that is returned when `onSnapshot` is called.
	**/
	function onSnapshot(optionsOrObserverOrOnNext:haxe.extern.EitherType<haxe.Constraints.Function, haxe.extern.EitherType<Dynamic, firebase.firestore.SnapshotListenOptions>>, observerOrOnNextOrOnError:haxe.extern.EitherType<haxe.Constraints.Function, haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>>, ?onError:haxe.Constraints.Function):haxe.Constraints.Function;
}