import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zero_hunger/helper/authenticate.dart';
import 'package:zero_hunger/services/auth.dart';
import 'package:zero_hunger/views/chatRoomsScreen.dart';
import 'package:firebase_database/firebase_database.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController _nameController, _numberController;
  String _typeSelected = '';
  DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Post'),
          backgroundColor: Colors.red[500],
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                  )),
              SizedBox(height: 15),
              TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    hintText: 'Enter Nunber',
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 30,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildContactType('Work'),
                    SizedBox(
                      width: 10,
                    ),
                    _buildContactType('Family'),
                    SizedBox(
                      width: 10,
                    ),
                    _buildContactType('Friends'),
                    SizedBox(
                      width: 10,
                    ),
                    _buildContactType('Others'),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Save Contact',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    saveContact();
                  },
                ),
              )
            ],
          ),
        ));
  }

  void saveContact() {
    String name = _nameController.text;
    String number = _numberController.text;

    Map<String, String> contact = {
      'name': name,
      'number': number,
      'type': _typeSelected,
    };

    _ref.push().set(contact).then((value){
      Navigator.pop(context);
    });
  }
}
