import 'package:firebase_auth/firebase_auth.dart';
import 'package:zero_hunger/models/userinfo.dart';
import 'package:zero_hunger/services/database.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Userinfo _userFromFirebaseUser(User user) {
    return user != null ? Userinfo(userId: user.uid) : null;
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      // DatabaseService(uid: firebaseUser.uid).updateUserData(username,'new crew member', '100');

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future signUpwithEmailAndPassword(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      await DatabaseService(uid: firebaseUser.uid).updateUserData( username, 'food','demo location');
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
