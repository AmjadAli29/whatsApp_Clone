import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chatModel.dart';
import 'CustomCard.dart';

class chatePage extends StatefulWidget {
  chatePage({Key key}) : super(key: key);
  @override
  _chatePageState createState() => _chatePageState();
}

class _chatePageState extends State<chatePage> {
  List<chatModel> chats=[
    chatModel(
      name: "Sajid Hussain",
      isgroup: false,
      crntMsgPage: "Dear..",
      time: "12:23",
      icon: "person"
    ),
     chatModel(
      name: "Kashif Hussain",
      isgroup: false,
      crntMsgPage: "Kashi",
      time: "1:23",
      icon: "person"
    ),
     chatModel(
      name: "Group of Programmer",
      isgroup: true,
      crntMsgPage: "hellow to all",
      time: "12:27",
      icon: "group"
    ),
     chatModel(
      name: "Munawar Hussain",
      isgroup: false,
      crntMsgPage: "Ke hall aa...Dear",
      time: "13:23",
      icon: "person"
    ),
    chatModel(
      name: "Flutter community",
      isgroup: true,
      crntMsgPage: "What's going on...?",
      time: "15:27",
      icon: "group"
    ),
    chatModel(
      name: "Asif Mcs",
      isgroup: false,
      crntMsgPage: "ke ho ria a..",
      time: "12:56",
      icon: "group"
    ),
    chatModel(
      name: "Faizan Tufail",
      isgroup: false,
      crntMsgPage: "Dear.. Mrzi aa",
      time: "19:27",
      icon: "group"
    ),
    chatModel(
      name: "Flutter Indigo",
      isgroup: true,
      crntMsgPage: "wellcom to all..",
      time: "17:27",
      icon: "group"
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatmodel:chats[index]),
        // children: [
        //   CustomCard(),
        //   CustomCard(),
        //   CustomCard(),
        //   CustomCard(),
        // ],
      ),
    );
  }
}