import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_signin_app/pages/home_page.dart';
import 'package:twitter_signin_app/pages/login_page.dart';
import 'package:twitter_signin_app/services/twitter_controller.dart';
import 'package:twitter_signin_app/shared/loading.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TwitterController(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        //initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final provider = Provider.of<TwitterController>(context);
          // if (provider.isSigningIn) {
          //   return Loading();
          // }
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
