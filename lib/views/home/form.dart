import 'package:flutter/material.dart';
import 'package:zero_hunger/helper/constants.dart';
import 'package:zero_hunger/widgets/widget.dart';
import 'package:flutter/widgets.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> choice = ['Donate', 'Accept'];

  //from values
  String _foodDesc;
  String _location;
  String _currentchoice;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Fill this to Post",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (val) =>
                  val.isEmpty ? 'Please enter food description' : null,
              onChanged: (val) => setState(() => _foodDesc = val),
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Please enter location' : null,
              onChanged: (val) => setState(() => _location = val),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              value: _currentchoice ?? 'Donate',
              items: choice
                  .map(
                    (choice) => DropdownMenuItem(
                      value: choice,
                      child: Text('$choice Food'),
                    ),
                  )
                  .toList(),
                  onChanged: (val) => setState(() => _currentchoice = val),

            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                color: Colors.red[500],
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_foodDesc);
                  print(_location);
                  print(_currentchoice);

                }),
          ],
        ),
      ),
    );
  }
}
