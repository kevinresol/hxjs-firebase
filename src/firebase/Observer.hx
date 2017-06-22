package firebase;
@:jsRequire("firebase", "Observer") extern interface Observer {
	function next(value:Dynamic):Void;
	function error(error:js.Error):Void;
	function complete():Void;
}