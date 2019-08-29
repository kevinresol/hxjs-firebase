package firebase;
@:jsRequire("firebase", "Observer") extern interface Observer<T> {
	function next(?value:Dynamic):Void;
	function error(error:Dynamic):Void;
	function complete():Void;
}