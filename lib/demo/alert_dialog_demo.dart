import 'package:flutter/material.dart';
import 'dart:async';

enum Action{
  OK,
  Cancel
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'nothing';

  Future _openAlertDialog() async{
    final action =  await showDialog(
      context: context,
      barrierDismissible:  false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.pop(context,Action.Cancel);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.pop(context,Action.OK);
              },
            )
          ],
        );
      }
    );
    switch (action) {
      case Action.OK:
        setState(() {
          _choice = 'OK';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation:  0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('your choice is $_choice'),
            SizedBox(height: 32.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}