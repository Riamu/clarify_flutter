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
String userID;

// TODO: Provide other login options.
Future<bool> signInToClarify() async {
  try {
    UserCredential userCredential = await signInWithGoogle();
    User user = userCredential.user;

    assert(user.displayName != null);
    name = user.displayName;
    // TODO: This name splitting is very brittle. Fix it.
    var firstLast = name.split(" ");
    firstName = firstLast[0];
    lastName = firstLast[1];
    assert(user.email != null);
    email = user.email;
    assert(user.photoURL != null);
    imageUrl = user.photoURL;
    assert(user.uid != null);
    userID = user.uid;

    return true;
  } catch (e) {
    print(e);
    // If anything goes wrong we just return false
    return false;
  }
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
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
