import 'package:comments_app/features/home_page/model/comment_data.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.commentData});
  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    return Text(commentData.name ?? "");
  }
}
