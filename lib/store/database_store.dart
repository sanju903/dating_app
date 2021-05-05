import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/data/chat.dart';
import 'package:minglewise_clone_app/data/message.dart';
import 'package:minglewise_clone_app/data/swipe.dart';
import 'package:minglewise_clone_app/data/match.dart';
import 'package:mobx/mobx.dart';
part 'database_store.g.dart';

class DatabaseStore = DatabaseStoreBase with _$DatabaseStore;

abstract class DatabaseStoreBase with Store {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @observable
  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  @observable
  CollectionReference chatcollection = FirebaseFirestore.instance.collection('chats');


  @action
  Future<void> pushintoFirestore(AppUser user){
    return userCollection.doc(user.id).set({
      'fullName': fullName.text,
      'email': email.text,
      'password': password.text,
    });
  }

  @action
  Future<void>addMatch(String uid,Match match){
    return userCollection.doc(uid).collection('matches').doc(match.id).set(match.toMap());
  }

  @action
  Future<void>addSwipedUser(String uid,Swipe swipe){
    return userCollection.doc(uid).collection('swipes').doc(swipe.id).set(swipe.toMap());
  }

  @action
  Future<DocumentSnapshot> getSwipe(String userId, String swipeId) {
    return userCollection
        .doc(userId)
        .collection('swipes')
        .doc(swipeId)
        .get();
  }

  @action
  Future<void> addChat(Chat chat) async {
    await userCollection.doc(chat.id).set(chat.toMap());
  }
  @action
  Future<void> addMessage(String chatId, Message message) async {
    await userCollection.doc(chatId).collection('messages').add(message.toMap());
  }
  @action
  Future<void> updateChat(Chat chat) async {
    chatcollection.doc(chat.id).update(chat.toMap());
  }
  @action
  Future<void> updateMessage(String chatId, String messageId, Message message) async {
    chatcollection
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .update(message.toMap());
  }
  @action
  Future<QuerySnapshot> getPersonsToMatchWith(
      int limit, List<String> ignoreIds) {
    return userCollection
        .where('id', whereNotIn: ignoreIds)
        .limit(limit)
        .get();
  }
  @action
  Future<QuerySnapshot> getMatches(String userId) {
    print("Getting user id"+userId);
    return userCollection.doc(userId).collection('matches').get();
  }
  @action
  Future<DocumentSnapshot> getChat(String chatId) {
    print("Getting chat id"+chatId);
    return chatcollection.doc(chatId).get();
  }
  @action
  Future<QuerySnapshot> getSwipes(String userId) {
    print("Getting swipe id"+userId);
    return userCollection.doc(userId).collection('swipes').get();
  }
  @action
  Stream<DocumentSnapshot> observeUser(String userId) {
    print("Getting observer id"+userId);
    return userCollection.doc(userId).snapshots();
  }
  @action
  Stream<QuerySnapshot> observeMessages(String chatId) {
    print("Getting chat id"+chatId);
    return chatcollection.doc(chatId)
        .collection('messages')
        .orderBy('epoch_time_ms', descending: true)
        .snapshots();
  }
  @action
  Stream<DocumentSnapshot> observeChat(String chatId) {
    print("Getting swipe id"+chatId);
    return chatcollection.doc(chatId).snapshots();
  }
}