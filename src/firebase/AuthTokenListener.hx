package firebase;
extern typedef AuthTokenListener = {
	/**
		Listener for an access token.
		
		Should pass null when the user current user is no longer value (signed
		out or credentials become invalid).
		
		Firebear does not currently auto-refresh tokens, BTW - but this interface
		would support that in the future.
	**/
	var AuthTokenListener : { };
}