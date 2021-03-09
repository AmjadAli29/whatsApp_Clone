import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chatPage.dart';
import 'CameraScreen.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  HomeScreen({this.cameras});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SocioCircle"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
        PopupMenuButton(
          onSelected: (value){
            print(value);

          },
          itemBuilder: (BuildContext context){
          return [
            PopupMenuItem(
              child: Text("New Group"),
              value: "New Group",
            ),
            PopupMenuItem(
              child: Text("New Broadcast"),
              value: "New Broadcast",
            ),
            PopupMenuItem(
              child: Text("SocioCircle Web"),
              value: "Web",
            ),
            PopupMenuItem(
              child: Text("Starred Messages"),
              value: "Starred Messages",
            ),
            PopupMenuItem(
              child: Text("Settings"),
              value: "Settings",
            )
          ];
        })
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )

            ],
          ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraScreen(widget.cameras),
          chatePage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
      
    );
  }
}