package firebase.auth;
@:jsRequire(#if firebase_admin "firebase-admin" #else "firebase" #end, "auth.AuthProvider") extern interface AuthProvider {
	var providerId : String;
}