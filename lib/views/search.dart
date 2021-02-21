import 'package:flutter/material.dart';
import 'package:zero_hunger/widgets/widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController sarchTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.black38,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: sarchTextEditingController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "search organizations",
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0x36FFFFFF),
                          const Color(0x0FFFFFF),
                        ]),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Image.asset("assets/images/search_white.png")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
