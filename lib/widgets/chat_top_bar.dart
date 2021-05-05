import 'package:flutter/material.dart';
import 'package:minglewise_clone_app/data/app_user.dart';
import 'package:minglewise_clone_app/store/login_store.dart';
class ChatTopBar extends StatelessWidget {
  final AppUser user;

  ChatTopBar({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(
                    'assets/user_images/tinder.png'
                  )),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              databasestore.fullName.text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
