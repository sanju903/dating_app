import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/data/chat.dart';
import 'package:minglewise_clone_app/data/message.dart';
import 'package:minglewise_clone_app/store/login_store.dart';
import 'package:minglewise_clone_app/widgets/chat_top_bar.dart';
import 'package:minglewise_clone_app/widgets/message_bubble.dart';

class ChatsScreen extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
  final messageTextController = TextEditingController();

  static const String id = 'chats_screen';

  final String chatId;
  final String myUserId;
  final String otherUserId;

  ChatsScreen(
      {@required this.chatId,
        @required this.myUserId,
        @required this.otherUserId});

  void checkAndUpdateLastMessageSeen(
      Message lastMessage, String messageId, String myUserId) {
    if (lastMessage.seen == false && lastMessage.senderId != myUserId) {
      lastMessage.seen = true;
      Chat updatedChat = Chat(chatId, lastMessage);

      databasestore.updateChat(updatedChat);
      databasestore.updateMessage(chatId, messageId, lastMessage);
    }
  }

  bool shouldShowTime(Message currMessage, Message messageBefore) {
    int halfHourInMilli = 1800000;

    if (messageBefore != null) {
      if ((messageBefore.epochTimeMs - currMessage.epochTimeMs).abs() >
          halfHourInMilli) {
        return true;
      }
    }
    return messageBefore == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: StreamBuilder<DocumentSnapshot>(
                stream: databasestore.observeUser(otherUserId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return ChatTopBar(user: AppUser.fromSnapshot(snapshot.data,null));
                })),
        body: Column(children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: databasestore.observeMessages(chatId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    List<Message> messages = [];
                    snapshot.data.docs.forEach((element) {
                      messages.add(Message.fromSnapshot(element));
                    });
                    if (snapshot.data.docs.length > 0) {
                      checkAndUpdateLastMessageSeen(
                          messages.first, snapshot.data.docs[0].id, myUserId);
                    }
                    if (_scrollController.hasClients)
                      _scrollController.jumpTo(0.0);

                    List<bool> showTimeList = new List<bool>(messages.length);

                    for (int i = messages.length - 1; i >= 0; i--) {
                      bool shouldShow = i == (messages.length - 1)
                          ? true
                          : shouldShowTime(messages[i], messages[i + 1]);
                      showTimeList[i] = shouldShow;
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final item = messages[index];
                        return ListTile(
                          title: MessageBubble(
                              epochTimeMs: item.epochTimeMs,
                              text: item.text,
                              isSenderMyUser:
                              messages[index].senderId == myUserId,
                              includeTime: showTimeList[index]),
                        );
                      },
                    );
                  })),
          getBottomContainer(context, myUserId)
        ]));
  }

  void sendMessage(String myUserId) {
    if (messageTextController.text.isEmpty) return;

    Message message = Message(DateTime.now().millisecondsSinceEpoch, false,
        myUserId, messageTextController.text);
    Chat updatedChat = Chat(chatId, message);
    databasestore.addMessage(chatId, message);
    databasestore.updateChat(updatedChat);
    messageTextController.clear();
  }

  Widget getBottomContainer(BuildContext context, String myUserId) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: messageTextController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle:
                    TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(0)),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              highlightElevation: 0,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "SEND",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                sendMessage(myUserId);
              },
            ),
          ],
        ),
      ),
    );
  }
}