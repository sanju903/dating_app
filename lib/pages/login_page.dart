import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/pages/register_page.dart';
import 'package:minglewise_clone_app/store/login_store.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginStore=LoginStore();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
              backgroundColor: Colors.white,
          key: loginStore.loginScaffoldKey,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Sign In With Email/Pass",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget("Email", textEditingController1),
                        PassWidget("Password", textEditingController2),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          constraints: const BoxConstraints(maxWidth: 500),
                          child:ElevatedButton(
                              onPressed: () {
                                if (textEditingController1.text.isNotEmpty &&
                                    textEditingController2.text.isNotEmpty) {
                                  loginStore.signInWithEmailPass(
                                      context,
                                      textEditingController1.text.trim(),
                                      textEditingController2.text.trim());
                                } else {
                                  loginStore.loginScaffoldKey.currentState
                                      // ignore: deprecated_member_use
                                      .showSnackBar(SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'Please Enter Email & Pass',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.indigo,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Are u a new user',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push (
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }

  Widget TextFieldWidget(
      String hint, TextEditingController textEditingController) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 60),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.black),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              controller: textEditingController,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                fillColor: Colors.indigo,
                focusColor: Colors.indigo,
                hoverColor: Colors.indigo,
                labelText: hint,
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                disabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget PassWidget(String hint, TextEditingController textEditingController) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 60),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.black),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.name,
              maxLines: 1,
              controller: textEditingController,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                fillColor: Colors.black,
                focusColor: Colors.black,
                hoverColor: Colors.black,
                labelText: hint,
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                disabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
