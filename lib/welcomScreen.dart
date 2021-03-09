import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/HomeScreen.dart';
import 'dart:async';

import 'package:whatsapp_clone/authen.dart';

class welcomScreen extends StatefulWidget {
  @override
  _welcomScreenState createState() => _welcomScreenState();
}

class _welcomScreenState extends State<welcomScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => authen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1533521981845-bda7c1c8e097?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'))
            //  gradient: LinearGradient(
            //    colors: [
            //      Colors.black87,
            //      Colors.lightGreenAccent
            //     //  const Color(0xC980BE),
            //     //  const Color(0xE427EB),
            //     // //  const Color(0x33FFF1),
            //     //  const Color(0x27DDEB)

            //      ],
            //       begin: Alignment.topLeft,
            //       end: Alignment(0.4, 5.0),
            //       tileMode: TileMode.clamp
            //       )
            ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 16,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.3))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 2.5,
                        color: Colors.teal[100].withOpacity(0.3),
                      )),
                      child: Center(child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Socio",
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Times New Roman"
                            ),
                          
                            ),
                            Text(
                            "Circle",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white ,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Times New Roman"
                            ),
                            ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
