package firebase;
@:jsRequire("firebase", "ServiceNamespace") extern interface ServiceNamespace {
	/**
		Given an (optional) app, return the instance of the service
		associated with that app.
	**/
	function app(?app:firebase.app.App):firebase.Service;
}