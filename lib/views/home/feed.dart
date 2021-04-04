import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_hunger/services/database.dart';
import 'package:zero_hunger/views/home/form.dart';
import 'feed_list.dart';
import 'package:zero_hunger/services/auth.dart';
import 'package:zero_hunger/helper/authenticate.dart';
import 'package:zero_hunger/models/feedinfo.dart';

class DisplayFeed extends StatefulWidget {
  @override
  _DisplayFeedState createState() => _DisplayFeedState();
}

class _DisplayFeedState extends State<DisplayFeed> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    void _showPannel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child:PostForm(),
            );
          });
    }

    return StreamProvider<List<Feed>>.value(
      value: DatabaseService().feed,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            height: 50,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                authMethods.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
        body: FeedCardList(),
        // bottomNavigationBar: CupertinoTabBar(
        //   activeColor:Colors.black,
        //   inactiveColor: Colors.grey,
        //   items: [
        //     BottomNavigationBarItem(
        //     icon: Icon(Icons.add_circle_outline_outlined),
        //     onTap: ;

        //     ),
        //     BottomNavigationBarItem(icon: Icon(Icons.verified_user)),
        //   ],

        //   ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showPannel();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
