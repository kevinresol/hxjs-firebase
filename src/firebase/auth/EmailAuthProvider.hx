package firebase.auth;
extern class EmailAuthProvider implements firebase.auth.AuthProvider {
	static var PROVIDER_ID : String;
	static function credential(email:String, password:String):firebase.auth.AuthCredential;
	var providerId : String;
}