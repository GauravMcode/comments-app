import 'dart:io';

import 'package:comments_app/common/utilities/utilities.dart';
import 'package:comments_app/data/api_service.dart';
import 'package:comments_app/features/home_page/model/comment_data.dart';
import 'package:logger/logger.dart';

class CommentsRepository {
  final logger = Logger();
  final apiService = ApiService();

  Future<List<CommentData>> fetchComments() async {
    try {
      final data = await apiService.sendRequest.get('/comments');
      return commentDataFromJson(data.data);
    } on SocketException catch (e) {
      showToast("Error sending request");
      logger.e(e);
      return [];
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
}
