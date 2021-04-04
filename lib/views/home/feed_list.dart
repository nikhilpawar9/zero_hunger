import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:zero_hunger/models/feedinfo.dart';
import 'feed_tile.dart';
import 'package:cupertino_icons/cupertino_icons.dart';



class FeedCardList extends StatefulWidget {
  @override
  _FeedCardListState createState() => _FeedCardListState();
}

class _FeedCardListState extends State<FeedCardList> {
  @override
  Widget build(BuildContext context) {
    final feed = Provider.of<List<Feed>>(context);
    feed.forEach((feed) {
      print(feed.name);
      print(feed.description);
      print(feed.location);
    });
    return ListView.builder(
      itemCount: feed.length,
      itemBuilder: (context, index) {
        return FeedTile(feed: feed[index]);
      },
      
    );
      
    
    
    ;
  }
}
