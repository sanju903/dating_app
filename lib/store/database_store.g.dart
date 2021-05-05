// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DatabaseStore on DatabaseStoreBase, Store {
  final _$userCollectionAtom = Atom(name: 'DatabaseStoreBase.userCollection');

  @override
  CollectionReference<Object> get userCollection {
    _$userCollectionAtom.reportRead();
    return super.userCollection;
  }

  @override
  set userCollection(CollectionReference<Object> value) {
    _$userCollectionAtom.reportWrite(value, super.userCollection, () {
      super.userCollection = value;
    });
  }

  final _$chatcollectionAtom = Atom(name: 'DatabaseStoreBase.chatcollection');

  @override
  CollectionReference<Object> get chatcollection {
    _$chatcollectionAtom.reportRead();
    return super.chatcollection;
  }

  @override
  set chatcollection(CollectionReference<Object> value) {
    _$chatcollectionAtom.reportWrite(value, super.chatcollection, () {
      super.chatcollection = value;
    });
  }

  final _$addChatAsyncAction = AsyncAction('DatabaseStoreBase.addChat');

  @override
  Future<void> addChat(Chat chat) {
    return _$addChatAsyncAction.run(() => super.addChat(chat));
  }

  final _$addMessageAsyncAction = AsyncAction('DatabaseStoreBase.addMessage');

  @override
  Future<void> addMessage(String chatId, Message message) {
    return _$addMessageAsyncAction.run(() => super.addMessage(chatId, message));
  }

  final _$updateChatAsyncAction = AsyncAction('DatabaseStoreBase.updateChat');

  @override
  Future<void> updateChat(Chat chat) {
    return _$updateChatAsyncAction.run(() => super.updateChat(chat));
  }

  final _$updateMessageAsyncAction =
      AsyncAction('DatabaseStoreBase.updateMessage');

  @override
  Future<void> updateMessage(String chatId, String messageId, Message message) {
    return _$updateMessageAsyncAction
        .run(() => super.updateMessage(chatId, messageId, message));
  }

  final _$DatabaseStoreBaseActionController =
      ActionController(name: 'DatabaseStoreBase');

  @override
  Future<void> pushintoFirestore(AppUser user) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.pushintoFirestore');
    try {
      return super.pushintoFirestore(user);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addMatch(String uid, Match match) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.addMatch');
    try {
      return super.addMatch(uid, match);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addSwipedUser(String uid, Swipe swipe) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.addSwipedUser');
    try {
      return super.addSwipedUser(uid, swipe);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<DocumentSnapshot<Object>> getSwipe(String userId, String swipeId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.getSwipe');
    try {
      return super.getSwipe(userId, swipeId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<QuerySnapshot<Object>> getPersonsToMatchWith(
      int limit, List<String> ignoreIds) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.getPersonsToMatchWith');
    try {
      return super.getPersonsToMatchWith(limit, ignoreIds);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<QuerySnapshot<Object>> getMatches(String userId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.getMatches');
    try {
      return super.getMatches(userId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<DocumentSnapshot<Object>> getChat(String chatId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.getChat');
    try {
      return super.getChat(chatId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<QuerySnapshot<Object>> getSwipes(String userId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.getSwipes');
    try {
      return super.getSwipes(userId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<DocumentSnapshot<Object>> observeUser(String userId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.observeUser');
    try {
      return super.observeUser(userId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot<Object>> observeMessages(String chatId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.observeMessages');
    try {
      return super.observeMessages(chatId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<DocumentSnapshot<Object>> observeChat(String chatId) {
    final _$actionInfo = _$DatabaseStoreBaseActionController.startAction(
        name: 'DatabaseStoreBase.observeChat');
    try {
      return super.observeChat(chatId);
    } finally {
      _$DatabaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userCollection: ${userCollection},
chatcollection: ${chatcollection}
    ''';
  }
}
