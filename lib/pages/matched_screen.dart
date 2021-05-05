import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/pages/chat_screen.dart';
import 'package:minglewise_clone_app/utils/utils.dart';

import 'chats_screen.dart';

class MatchedScreen extends StatelessWidget {

  static const String id = 'matched_screen';
  final String myUserId;
  final String otherUserId;
  String userId;
  final AppUser user;

  MatchedScreen({@required this.user, this.myUserId, this.otherUserId});
  void sendMessagePressed(BuildContext context) async {
    User firebaseUser;
    firebaseUser=FirebaseAuth.instance.currentUser;

    if (firebaseUser != null){
      userId=firebaseUser.uid;
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, ChatsScreen.id, arguments: {
      "chat_id": compareAndCombineIds(myUserId, otherUserId),
      "user_id": firebaseUser.uid,
      "other_user_id": otherUserId
    });
  }

  void keepSwipingPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 42.0,
            horizontal: 18.0,
          ),
          margin: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/user_images/tinder.png', width: 40),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //add images here
                  ],
                ),
              ),
              Column(
                children: [
                Container(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  highlightElevation: 0,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Text('SEND MESSAGE', style: Theme.of(context).textTheme.button),
                  onPressed:() {
                    sendMessagePressed(context);
                  },
                ),
              ),
                  SizedBox(height: 20),
        Container(
            width: double.infinity,
            child: OutlineButton(
              child: Text('KEEP SWIPING', style: Theme.of(context).textTheme.button),
              onPressed: (){
                keepSwipingPressed(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
