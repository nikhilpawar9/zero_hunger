import 'package:flutter/material.dart';
import 'package:zero_hunger/helper/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zero_hunger/helper/helperfunctions.dart';
import 'package:zero_hunger/views/feed.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Hunger',
      debugShowCheckedModeBanner: false,
      home: userIsLoggedIn ? DisplayFeed() : Authenticate(),
    );
  }
}
