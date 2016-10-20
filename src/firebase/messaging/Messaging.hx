package firebase.messaging;
@:jsRequire("firebase.messaging", "Messaging") extern interface Messaging {
	/**
		Notification permissions are required to send a user push messages.
		Calling this method displays the permission dialog to the user and
		resolves if the permission is granted.
	**/
	function requestPermission():firebase.Promise<Dynamic>;
	/**
		After calling `requestPermission()` you can call this method to get an FCM
		registration token that can be used to send push messages to this user.
	**/
	function getToken():firebase.Promise<String>;
	/**
		You should listen for token refreshes so your web app knows when FCM
		has invalidated your existing token and you need to call `getToken()`
		to get a new token.
	**/
	function onTokenRefresh(nextOrObserver:haxe.extern.EitherType<Dynamic, Dynamic>):Dynamic;
	/**
		When a push message is received and the user is currently on a page
		for your origin, the message is passed to the page and an `onMessage()`
		event is dispatched with the payload of the push message.
		
		NOTE: These events are dispatched when you have called
		`setBackgroundMessageHandler()` in your service worker.
	**/
	function onMessage(nextOrObserver:haxe.extern.EitherType<Dynamic, Dynamic>):Dynamic;
	/**
		To forceably stop a registration token from being used, delete it
		by calling this method.
	**/
	function deleteToken(token:String):firebase.Promise<Dynamic>;
	/**
		To use your own service worker for receiving push messages, you
		can pass in your service worker registration in this method.
	**/
	function useServiceWorker(registration:Dynamic):Void;
	/**
		FCM directs push messages to your web page's `onMessage()` callback
		if the user currently has it open. Otherwise, it calls
		your callback passed into `setBackgroundMessageHandler()`.
		
		Your callback should return a promise that, once resolved, has
		shown a notification.
	**/
	function setBackgroundMessageHandler(callback:Dynamic):Void;
}