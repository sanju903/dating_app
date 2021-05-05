import 'package:firebase_auth/firebase_auth.dart';
import 'package:minglewise_clone_app/data/chat.dart';
import 'package:minglewise_clone_app/data/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/widgets/swipe_card.dart';
import 'chat_screen.dart';
import 'package:minglewise_clone_app/data/swipe.dart';
import 'package:minglewise_clone_app/store/login_store.dart';
import 'package:minglewise_clone_app/utils/utils.dart';

import 'matched_screen.dart';

class MatchScreen extends StatefulWidget {
  static const String id = 'match_screen';

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  // List<String> _ignoreSwipeIds;
  String userId;
  // Future<AppUser> loadPerson(String myUserId) async {
  //   if (_ignoreSwipeIds == null) {
  //     _ignoreSwipeIds = List<String>();
  //     var swipes = await databasestore.getSwipes(myUserId);
  //     for (var i = 0; i < swipes.size; i++) {
  //       Swipe swipe = Swipe.fromSnapshot(swipes.docs[i]);
  //       _ignoreSwipeIds.add(swipe.id);
  //     }
  //     _ignoreSwipeIds.add(myUserId);
  //   }
  //   var res = await databasestore.getPersonsToMatchWith(1, _ignoreSwipeIds);
  //   if (res.docs.length > 0) {
  //     var userToMatchWith = AppUser.fromSnapshot(res.docs.first);
  //     return userToMatchWith;
  //   } else {
  //     return null;
  //   }
  // }
  void personSwiped(AppUser myUser, AppUser otherUser, bool isLiked) async {
    // databasestore.addSwipedUser(myUser.id, Swipe(otherUser.id, isLiked));
    // _ignoreSwipeIds.add(otherUser.id);

    if (isLiked == true) {
      // if (await isMatch(myUser, otherUser) == true) {
      User firebaseUser;
      firebaseUser=FirebaseAuth.instance.currentUser;

      if (firebaseUser != null){
        userId=firebaseUser.uid;
      }
      DocumentSnapshot doc = await databasestore.userCollection.doc(firebaseUser.uid).get();
      Map _docdata = doc.data();
      myUser = AppUser.fromSnapshot(doc,_docdata);
      otherUser = AppUser.fromSnapshot(doc,_docdata);
        databasestore.addMatch(myUser.id, Match(otherUser.id));
        databasestore.addMatch(otherUser.id, Match(myUser.id));
        String chatId = compareAndCombineIds(myUser.id, otherUser.id);
        databasestore.addChat(Chat(chatId, null));
        Navigator.pushNamed(context, MatchedScreen.id, arguments: {
          "my_user_id": myUser.id,
          "other_user_id": otherUser.id
        });
      // }
    }
    setState(() {});
  }

  // Future<bool> isMatch(AppUser myUser, AppUser otherUser) async {
  //   DocumentSnapshot swipeSnapshot =
  //   await databasestore.getSwipe(otherUser.id, myUser.id);
  //   if (swipeSnapshot.exists) {
  //     Swipe swipe = Swipe.fromSnapshot(swipeSnapshot);
  //
  //     if (swipe.liked == true) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:FutureBuilder<AppUser>(
            future: loginstore.user,
            builder: (context,usersnapshot){
              return Container(
                child:(usersnapshot.hasData)
                    ?FutureBuilder<AppUser>(
                  builder: (context,chatsnapshot) {
                    if(chatsnapshot.connectionState==ConnectionState.waiting&&!chatsnapshot.hasData){
                   return CircularProgressIndicator();
                  }
                    else if(chatsnapshot.connectionState==ConnectionState.active){
                      return Center(
                        child: Container(
                            child: Text('No matches',
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                      );
                    }
                  if (!usersnapshot.hasData) {
                return Container();
              }
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        SwipeCard(),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 45),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  MaterialButton(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    minWidth: 0,
                                    elevation: 5,
                                    color: Colors.white,
                                    onPressed:() {
                                      personSwiped(
                                          usersnapshot.data,
                                          chatsnapshot.data,
                                          false);
                                    },
                                    child: Icon( Icons.clear, size: 30),
                                    shape: CircleBorder(),
                                  ),
                                  MaterialButton(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    minWidth: 0,
                                    elevation: 5,
                                    color: Colors.white,
                                    onPressed:() {
                                      personSwiped(
                                          usersnapshot.data,
                                          chatsnapshot.data,
                                          true);
                                    },
                                    child: Icon( Icons.favorite, size: 30),
                                    shape: CircleBorder(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
                  }):Container(),
              );
            },
          ),
        )
    );
  }
}