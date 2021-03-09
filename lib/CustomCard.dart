import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chatModel.dart';
import 'individualPage.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key key, this.chatmodel}) : super(key: key);
  final chatModel chatmodel;
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => individualPage(chatmodel: chatmodel),
        ));
      },
        
       child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: chatmodel.isgroup? Icon(Icons.group): Icon(Icons.person),
            ),
            title: Text(
              chatmodel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
              )
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 5,),
                Text(chatmodel.crntMsgPage),
              ],
            ),
            trailing: Text(chatmodel.time),
            
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 0.5,
            ),
          )
        ],
      ),
    );
  }
}