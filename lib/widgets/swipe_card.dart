import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/store/login_store.dart';

class SwipeCard extends StatefulWidget {
  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.725,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset('assets/user_images/sample.jpg', fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Column(
              children: [
                Padding(
                    padding: showInfo
                        ? EdgeInsets.symmetric(horizontal: 8, vertical: 4)
                        : EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: getUserContent(context)),
                showInfo ? getBottomInfo() : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getUserContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: databasestore.fullName.text,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            )),
            MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minWidth: 0,
              elevation: 5,
              color: Colors.yellow,
              onPressed: () {
                setState(() {
                  showInfo = !showInfo;
                });
              },
              child: Icon(showInfo ? Icons.arrow_downward : Icons.person,
                  size: 16),
              shape: CircleBorder(),
            ),
          ],
        ),
      ],
    );
  }

  Widget getBottomInfo() {
    return Column(
      children: [
        Divider(
          color: Colors.yellow,
          thickness: 1.5,
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.black.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    "I am sanjeevi from LICET",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
