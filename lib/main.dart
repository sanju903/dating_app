import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/pages/chat_screen.dart';
import 'package:minglewise_clone_app/pages/home_page.dart';
import 'package:minglewise_clone_app/pages/match_screen.dart';
import 'package:minglewise_clone_app/pages/login_page.dart';
import 'package:minglewise_clone_app/pages/register_page.dart';
import 'package:minglewise_clone_app/pages/top_navigation.dart';
import 'package:minglewise_clone_app/pages/chats_screen.dart';
import 'pages/matched_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        TopNavigationScreen.id:(context)=>TopNavigationScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomePage.id: (context) => HomePage(),
        MatchScreen.id: (context) => MatchScreen(),
        MatchedScreen.id: (context) => MatchedScreen(
          myUserId: (ModalRoute.of(context).settings.arguments
          as Map)['my_user_id'],
          otherUserId: (ModalRoute.of(context).settings.arguments
          as Map)['other_user_id'], user: null,
        ),
        ChatScreen.id: (context) => ChatScreen(user: null,),
        ChatsScreen.id: (context) => ChatsScreen(
          chatId: (ModalRoute.of(context).settings.arguments
          as Map)['chat_id'],
          otherUserId: (ModalRoute.of(context).settings.arguments
          as Map)['other_user_id'],
          myUserId: (ModalRoute.of(context).settings.arguments
          as Map)['user_id'],
        ),
      },
    );
  }
}


