import 'package:flutter/material.dart';
import 'package:twitter_signin_app/services/twitter_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = TwitterController();

    return Scaffold(
      body: Column(
        children: [
          Text('You are logged in'),
        ],
      ),
    );
  }
}
