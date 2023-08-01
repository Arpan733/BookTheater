import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? PicUrl = AuthController.instance.user?.photoURL;
    PicUrl = PicUrl ?? Constants.dummyAvatar;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "777 reviews",
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Write Yours >",
                  style: TextStyle(
                    color: Mytheme.splash,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(
                PicUrl,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AuthController.instance.user!.displayName ?? "User",
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  TextSpan(
                    text: DateFormat('MM-dd-yyyy HH:mm')
                        .format(DateTime.now())
                        .toString(),
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Three Idiots’ is a remarkable ahead of its time Bollywood blockbuster. This film is a comedy movie with strong acting, memorable characters, a perplexing storyline and most importantly, highly motivational movie to choose the right path in your life.",
            ),
          ),
        ],
      ),
    );
  }
}
