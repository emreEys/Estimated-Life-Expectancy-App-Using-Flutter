import 'package:flutter/material.dart';

import 'calculate.dart';
import 'user_data.dart';

class ResultPage extends StatelessWidget {
  UserData? _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Result page',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 9,
                child: Center(
                    child: Text(
                  Calculus(_userData!).calculate().round().toString(),
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
            Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'BACK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
