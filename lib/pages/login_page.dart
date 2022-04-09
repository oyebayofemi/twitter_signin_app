import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:twitter_signin_app/services/twitter_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Text('Login with Twitter..'),
            ButtonTheme(
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.transparent)),
              child: SignInButton(
                Buttons.Twitter,
                text: "Sign in with Twitter",
                onPressed: () async {
                  final provider =
                      Provider.of<TwitterController>(context, listen: false);
                  provider.loginWithTwitter();
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
