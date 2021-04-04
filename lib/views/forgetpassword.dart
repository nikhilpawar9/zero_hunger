import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),
      backgroundColor: Colors.red[500],),
      body: Column(
        
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height ,
              alignment: Alignment.center,            
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(  
                        hintText: 'Email'
                      ),
                       onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(height:16),

                   RaisedButton(
                child: Text('Send Request'),
                textColor: Colors.white,
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                color: Colors.red[500],
              ),
                ],
                
               

              
              ),
            ),
          ),
          

        ],),
    );
  }
}
