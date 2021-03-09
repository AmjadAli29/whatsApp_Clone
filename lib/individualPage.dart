import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'chatModel.dart';

class individualPage extends StatefulWidget {
  const individualPage({Key key, this.chatmodel}) : super(key: key);
  final chatModel chatmodel;
  @override
  _individualPageState createState() => _individualPageState();
}

class _individualPageState extends State<individualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller= TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  // Widget EmojiSelect(){
  //   return EmojiPicker(
  //     rows: 4,
  //     columns: 7,
  //     onEmojiSelected: (emoji, category){
  //       print(emoji);
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        titleSpacing: 3,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 25,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: widget.chatmodel.isgroup
                    ? Icon(Icons.group)
                    : Icon(Icons.person),
              )
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatmodel.name,
              style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Last seen today at 06:49",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text("Media, Links, and Docs"),
                  value: "Media",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notifications"),
                  value: "Mute Notifictions",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                )
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                              margin:
                                  EdgeInsets.only(left: 5, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions),
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                  ),
                                  hintText: "Type a Message",
                                  contentPadding: EdgeInsets.only(
                                    left: 15,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder)=> bottshet(),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.camera_alt),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.teal[500],
                            child: IconButton(
                              icon: Icon(Icons.mic),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    show ? emojiSelect() : Container(),
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottshet(){
    return Container(
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        elevation: 15.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
          
              children: [
                iconCreation(Icons.insert_drive_file,Colors.indigoAccent,"Document"),
                iconCreation(Icons.camera_alt,Colors.pinkAccent,"Camera"),
                iconCreation(Icons.insert_photo,Colors.purpleAccent,"Gallary"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
          
              children: [
                iconCreation(Icons.headset,Colors.orange,"Audio"),
                iconCreation(Icons.location_pin,Colors.green,"Location"),
                iconCreation(Icons.person,Colors.indigoAccent,"Contact"),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget iconCreation( IconData icon, Color color, String txt){
    return InkWell(
      onTap: (){},
          child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
              ),
            
          ),
          SizedBox(height: 5,),
          Text(txt)

        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
        
          setState(() {
            _controller.text=_controller.text + emoji.emoji;
          });
        });
  }
}
