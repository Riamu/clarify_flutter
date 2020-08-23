import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// TODO: Refactor this with better encapsulation (singleton).
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String firstName;
String lastName;
String email;
String imageUrl;

// TODO: Provide other login options.
Future<bool> signInWithGoogle() async {
  try {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);

    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    var firstLast = name.split(" ");
    firstName = firstLast[0];
    lastName = firstLast[1];
    email = user.email;
    imageUrl = user.photoUrl;

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return true;
  } catch (e) {
    // If anything goes wrong we just return false
    return false;
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  name = null;
  firstName = null;
  lastName = null;
  email = null;
  imageUrl = null;

  print("User Sign Out");
}
