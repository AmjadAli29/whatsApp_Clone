import 'package:flutter/material.dart';
import 'HomeScreen.dart';
class authen extends StatefulWidget {
  @override
  _authenState createState() => _authenState();
}

class _authenState extends State<authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.verified),
          onPressed: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
          },
        ),
      ),
      
    );
  }
}