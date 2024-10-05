import 'package:comments_app/features/home/model/comment_data.dart';
import 'package:comments_app/repository/comments_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<CommentData> _comments = [];
  final bool _maskEmail = false;
  bool _loading = false;
  List<CommentData> get comments => _comments;
  final commentRepository = CommentsRepository();

  get isMaskEmail => _maskEmail;

  get loading => _loading;

  getComments() async {
    _loading = true;
    notifyListeners();
    _comments = await commentRepository.fetchComments();
    _loading = false;
    notifyListeners();
  }
}
