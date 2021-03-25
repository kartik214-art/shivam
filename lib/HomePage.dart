import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  String value;
  HomePage({Key key,@required this.value}) : super(key:key);
  @override
  _HomePageState createState() => _HomePageState(value);
}

class _HomePageState extends State<HomePage> {
  String value;
  _HomePageState(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'homepahe',
        )
      ),
      body: Center(
        child: Text(
          value,
        ),
      ),
    );
  }
}
