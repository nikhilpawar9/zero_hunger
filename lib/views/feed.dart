import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:zero_hunger/services/auth.dart';
import 'package:zero_hunger/helper/authenticate.dart';
import 'package:zero_hunger/views/edit_feed.dart';
import 'package:zero_hunger/views/upload.dart';

class DisplayFeed extends StatefulWidget {
  @override
  _DisplayFeedState createState() => _DisplayFeedState();
}

class _DisplayFeedState extends State<DisplayFeed> {
  AuthMethods authMethods = new AuthMethods();

  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Contacts');

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Widget _buildContactItem({Map contact}) {
    Color typeColor = getTypeColor(contact['type']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['name'],
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['number'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.group_work,
                color: typeColor,
                size: 25,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['type'],
                style: TextStyle(
                  fontSize: 16,
                  color: typeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditFeed(
                                contactKey: contact['key'],
                              )));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  _showDeleteDailog(contact: contact);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  _showDeleteDailog({Map contact}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${contact['name']}'),
            content: Text('Are you sure you want to Delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    reference
                        .child(contact['key'])
                        .remove()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.red[500],
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            contact['key'] = snapshot.key;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Upload()));
        },
        label: Text('Upload'),
        icon: Icon(Icons.file_upload),
        backgroundColor: Colors.red[500],
      ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Work') {
      color = Colors.brown;
    }
    if (type == 'Family') {
      color = Colors.green;
    }
    if (type == 'Friends') {
      color = Colors.purple;
    }
    return color;
  }
}
