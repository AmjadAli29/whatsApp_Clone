import 'package:flutter/material.dart';
import 'package:whatsapp_clone/HomeScreen.dart';
// import 'package:whatsapp_clone/welcomScreen.dart';
import 'package:camera/camera.dart';

//import 'HomeScreen.dart';
List<CameraDescription> cameras;


Future<Null> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras =  await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "whatsApp_clone",
    theme: ThemeData(
      primaryColor: Color(0xFF075E54), accentColor: Color(0xFF128C7E),
      

    ),
    home: new HomeScreen(cameras:cameras),

  ));
}