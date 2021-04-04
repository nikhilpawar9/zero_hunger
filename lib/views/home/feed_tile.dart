import 'package:flutter/material.dart';
import 'package:zero_hunger/models/feedinfo.dart';

class FeedTile extends StatelessWidget {
  final Feed feed;
  FeedTile({this.feed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown,
            ),

        title: Text(feed.description),
        subtitle: Text("${feed.name} | Location : ${feed.location}"),

            
        ),
      ),
    );
  }
}


