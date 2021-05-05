import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/store/login_store.dart';
import 'package:minglewise_clone_app/widgets/chat_with_user.dart';
import 'package:minglewise_clone_app/widgets/chats_list.dart';

import 'chats_screen.dart';
final loginstore=LoginStore();
class ChatScreen extends StatefulWidget {
  final AppUser user;

  ChatScreen({ this.user});

  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void chatWithUserPressed(ChatWithUser chatWithUser) async {
    Navigator.pushNamed(context, ChatsScreen.id, arguments: {
      "chat_id": chatWithUser.chat.id,
      "user_id": widget.user.id,
      "other_user_id": chatWithUser.user.id
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AppUser>(
          future: loginstore.user,
          builder: (context,usersnapshot){
            if (usersnapshot.hasData) {
              return FutureBuilder<List<ChatWithUser>>(
                    future: loginstore.getChatsWithUser(usersnapshot.data.id),
                      builder: (context,chatsnapshot){
                        if(chatsnapshot.data==null && chatsnapshot.connectionState==ConnectionState.waiting){
                          print('there is nothing');
                          return Container();
                        }
                        else{
                          print('there is something');
                          return chatsnapshot.data.length==0?
                              Center(
                                child:Container(
                                    child: Text('No users',
                                        style:TextStyle(color: Colors.black))),
                              )
                              :ChatsList(
                            chatWithUserList: chatsnapshot.data,
                            onChatWithUserTap: chatWithUserPressed,
                            myUserId: usersnapshot.data.id,
                          );
                        }
                      }
                  );
            } else {
              return Container();
            }
          },
        ),
      );
  }
}