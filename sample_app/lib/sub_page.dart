
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("subPage"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("戻る"),
          ),
        ),
      ),
    );
  }

}