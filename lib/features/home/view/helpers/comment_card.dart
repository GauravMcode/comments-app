import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/features/home/model/comment_data.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.commentData});
  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight!;
    final w = SizeConfig.screenWidth;
    return SizedBox(
      child: Column(
        children: [],
      ),
    );
  }
}
