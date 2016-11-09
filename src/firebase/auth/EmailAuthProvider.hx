package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.EmailAuthProvider") extern class EmailAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	static function credential(email:String, password:String):firebase.auth.AuthCredential;
	var providerId : String;
}