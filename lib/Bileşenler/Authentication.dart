import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final _firebaseAuth = FirebaseAuth.instance;      //Firebase'e ulaşmak için

  Future<User> signInAnonymously() async {
    final UserCredential = await _firebaseAuth.signInAnonymously();
    return UserCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  Stream<User> authStatus() {
    return _firebaseAuth.authStateChanges();
  }

  Future<User> createNewUserWithEmailandPassword(
      String email, String password) async {
    final UserCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserCredentials.user;
  }

  Future<User> signInWithEmailandPassword(String email, String password) async {
    final UserCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserCredentials.user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } else {
      return null;
    }
  }
  //------------------------------------------------FUNCTIONS-----------------------------------------------------------------------------------




}


