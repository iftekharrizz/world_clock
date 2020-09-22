import 'package:flutter/material.dart';

class ExceptionCaught extends StatefulWidget {
  @override
  _ExceptionCaughtState createState() => _ExceptionCaughtState();
}

class _ExceptionCaughtState extends State<ExceptionCaught> {

  Map exceptionData =  {};

  @override
  Widget build(BuildContext context) {

    exceptionData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.red[300],
      body: Center(
        child: SafeArea(
          child: Text(
            exceptionData['time'],
            style: TextStyle(
              fontSize: 25.0,
            ),
          )
        ),
      ),
    );
  }
}
