import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/chat.dart';
import 'package:minglewise_clone_app/pages/login_page.dart';
import 'package:minglewise_clone_app/pages/top_navigation.dart';
import 'package:minglewise_clone_app/utils/utils.dart';
import 'package:minglewise_clone_app/widgets/chat_with_user.dart';
import 'package:mobx/mobx.dart';
import 'database_store.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/data/match.dart';
part 'login_store.g.dart';


final databasestore=DatabaseStore();

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String actualCode;

  String userid;

  Future<AppUser> get user => _getUser();

  @observable
  AppUser appuser;

  @observable
  bool isLoginLoading = false;

  @observable
  bool isOtpLoading = false;

  @observable
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  User firebaseUser;

  @action
  Future<AppUser> _getUser() async {

    firebaseUser=_auth.currentUser;

    if (firebaseUser != null){
      userid=firebaseUser.uid;
    }

    // print("Getting user id"+appuser.id);
    DocumentSnapshot doc = await databasestore.userCollection.doc(firebaseUser.uid).get();
    Map _docdata = doc.data();
    appuser = AppUser.fromSnapshot(doc,_docdata);

    return appuser;

  }

  @action
  Future<bool> isAlreadyAuthenticated() async {
    //print("checking auth");
    firebaseUser = _auth.currentUser;
    //print("User Phone - " + u.phoneNumber);
    //firebaseUser = u;
    //print("fbUser - " + firebaseUser.phoneNumber);
    //firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      print("true");
      return true;
    } else {
      print("false");
      return false;
    }
  }

  @action
  Future<void> signInWithEmailPass(
      BuildContext context, String email, String pass) async {
    isLoginLoading = true;

    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: pass.trim())
          .then((authResult) {
        if (authResult != null && authResult.user != null) {
          print('Authentication successful');
          onAuthenticationSuccessful(context, authResult);
        }
      });
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          print("Your email address appears to be malformed.");
          break;
        case "ERROR_WRONG_PASSWORD":
          print("Your password is wrong.");
          break;
        case "ERROR_USER_NOT_FOUND":
          print("User with this email doesn't exist.");
          break;
        case "ERROR_USER_DISABLED":
          print("User with this email has been disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          print("Too many requests. Try again later.");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          print("Signing in with Email and Password is not enabled.");
          break;
        default:
          print("An undefined Error happened.");
      }
    }
  }

  @action
  Future<void> registerWithEmailPass(BuildContext context) async {
    isLoginLoading = true;

    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: databasestore.email.text.trim(),
              password: databasestore.password.text.trim())
          .then((authResult) {
        if (authResult != null && authResult.user != null) {
          print('Authentication successful');
          onAuthenticationSuccessful(context, authResult);
        }
      });
    }

    catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          print("Your email address appears to be malformed.");
          break;
        case "ERROR_WRONG_PASSWORD":
          print("Your password is wrong.");
          break;
        case "ERROR_USER_NOT_FOUND":
          print("User with this email doesn't exist.");
          break;
        case "ERROR_USER_DISABLED":
          print("User with this email has been disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          print("Too many requests. Try again later.");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          print("Signing in with Email and Password is not enabled.");
          break;
        default:
          print("An undefined Error happened.");
      }
    }

  }
  @action
  Future<void> onAuthenticationSuccessful(BuildContext context,  result) async {
    isLoginLoading = true;
    isOtpLoading = true;

    firebaseUser = result.user;
     appuser = AppUser(
      id: firebaseUser.uid,);
    databasestore.pushintoFirestore(appuser);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) =>  TopNavigationScreen()),
        (Route<dynamic> route) => false);
    isLoginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (Route<dynamic> route) => false);
    firebaseUser = null;
  }
@action
Future<List<ChatWithUser>> getChatsWithUser(String userId) async {
  var matches = await databasestore.getMatches(userId);

  List<ChatWithUser> chatWithUserList = [];

  for (var i = 0; i < matches.docs.length; i++) {

    DocumentSnapshot doc = await databasestore.userCollection.doc(firebaseUser.uid).get();

    Map _docdata = doc.data();

    Match match = Match.fromSnapshot(matches.docs[i]);

    AppUser matchedUser = AppUser.fromSnapshot(doc,_docdata);

    String chatId = compareAndCombineIds(match.id, userId);

    Chat chat = Chat.fromSnapshot(await databasestore.getChat(chatId));

    ChatWithUser chatWithUser = ChatWithUser(chat, matchedUser);

    chatWithUserList.add(chatWithUser);
  }
  return chatWithUserList;
}
}
