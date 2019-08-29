package firebase.auth;
extern typedef ActionCodeSettings = {
	/**
		This is the interface that defines the required continue/state URL with
		optional Android and iOS bundle identifiers.
		The action code setting fields are:
		<ul>
		<li><p>url: Sets the link continue/state URL, which has different meanings
		    in different contexts:</p>
		    <ul>
		    <li>When the link is handled in the web action widgets, this is the deep
		        link in the continueUrl query parameter.</li>
		    <li>When the link is handled in the app directly, this is the continueUrl
		        query parameter in the deep link of the Dynamic Link.</li>
		    </ul>
		    </li>
		<li>iOS: Sets the iOS bundle ID. This will try to open the link in an iOS app
		    if it is installed.</li>
		<li>android: Sets the Android package name. This will try to open the link in
		    an android app if it is installed. If installApp is passed, it specifies
		    whether to install the Android app if the device supports it and the app
		    is not already installed. If this field is provided without a
		    packageName, an error is thrown explaining that the packageName must be
		    provided in conjunction with this field.
		    If minimumVersion is specified, and an older version of the app is
		    installed, the user is taken to the Play Store to upgrade the app.</li>
		<li>handleCodeInApp: The default is false. When set to true, the action code
		    link will be be sent as a Universal Link or Android App Link and will be
		    opened by the app if installed. In the false case, the code will be sent
		    to the web widget first and then on continue will redirect to the app if
		    installed.</li>
		</ul>
	**/
	var ActionCodeSettings : { var url : String; var iOS : Dynamic; var android : Dynamic; var minimumVersion : haxe.extern.EitherType<Dynamic, String>; var handleCodeInApp : Bool; };
}