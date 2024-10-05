import 'package:comments_app/config/app_colors.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/data/remote_cofig_service.dart';
import 'package:comments_app/features/home/model/comment_data.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.commentData});
  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight!;
    final w = SizeConfig.screenWidth!;
    final remoteConfig = FirebaseRemoteConfigService();
    return SizedBox(
      width: w * 0.92,
      child: Card(
        elevation: 20,
        color: kcWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: kcSecondaryColorDark,
                foregroundColor: kcBlack,
                child: Text(
                  commentData.name?[0].toUpperCase() ?? "A",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: w * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name : ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: kcSecondaryColorDark),
                      ),
                      SizedBox(
                        width: w * 0.53,
                        child: Text(commentData.name ?? "",
                            style: TextStyle(
                                color: kcPrimaryColorDark,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Email : ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: kcSecondaryColorDark),
                      ),
                      SizedBox(
                        width: w * 0.53,
                        child: Text(
                            maskEmail(
                                commentData.email!, remoteConfig.maskEmail),
                            style: TextStyle(
                                color: kcPrimaryColorDark,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: w * 0.7,
                    child: Text(commentData.body ?? ""),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String maskEmail(String email, bool mask) {
  if (mask) {
    final first = email.split("@")[0];
    final last = email.split("@")[1];
    if (first.length > 3) {
      String maskedEmail = first.substring(0, 3);
      maskedEmail += "*" * (first.length - 3);
      return "$maskedEmail@$last";
    }
    return email;
  }
  return email;
}
