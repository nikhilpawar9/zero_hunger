import 'package:flutter/material.dart';
import 'package:zero_hunger/helper/authenticate.dart';
import 'package:zero_hunger/services/auth.dart';
import 'package:zero_hunger/views/chatRoomsScreen.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Post'),
         backgroundColor: Colors.red[500],
      ),
      body: Center(
        
      ),
    );
  }
}
