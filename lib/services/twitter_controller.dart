import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterController extends ChangeNotifier {
  // late bool _isSigningIn;
  // TwitterController() {
  //   _isSigningIn = false;
  // }

  // bool get isSigningIn => _isSigningIn;

  // set isSigningIn(bool isSigningIn) {
  //   _isSigningIn = isSigningIn;
  //   notifyListeners();
  // }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future loginWithTwitter() async {
    //isSigningIn = true;
    final twitterLogin = TwitterLogin(
        apiKey: 'D9fw5ZrMMGFXsyXLQ9IJeR1iY',
        apiSecretKey: 'ebevRCAzb4Z2gkSTumKhgdBH9B78yPIaZMr4nrQe2CtW2NXm3W',
        redirectURI: 'twittersdk://');

    final authResult = await twitterLogin.login().then((value) async {
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    });

    // Once signed in, return the UserCredential

    //isSigningIn = false;
    notifyListeners();

    //isSigningIn = true;
  }

  Future signout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
