import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/models/group.dart';
import 'package:social_app/screens/main/inbox/chats/chat.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    Color bg = Colors.black;
    Color fg = Color(0xff121212);
    Color tg = Color(0xff595959);
    List<GroupModel> groups = Provider.of<List<GroupModel>>(context) ?? [];

    return ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          GroupModel group = groups[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chat(
                            groupName: group.groupName,
                            groupId: group.id,
                            groupImageUrl: group.groupImageUrl,
                            
                          )),
                );
              },
              tileColor: fg,
              title:
                  Text(group.groupName, style: TextStyle(color: Colors.white)),
              leading: ClipOval(child: Image.network(group.groupImageUrl ?? "https://png.pngtree.com/png-clipart/20190918/ourmid/pngtree-load-the-3273350-png-image_1733730.jpg", fit: BoxFit.cover, height:50, width:50)),
            ),
          );
        });
  }
}
