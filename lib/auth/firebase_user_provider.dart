import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EdDictateFirebaseUser {
  EdDictateFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EdDictateFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EdDictateFirebaseUser> edDictateFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<EdDictateFirebaseUser>(
        (user) => currentUser = EdDictateFirebaseUser(user));
