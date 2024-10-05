List<CommentData> commentDataFromJson(List str) =>
    List<CommentData>.from(str.map((x) => CommentData.fromJson(x)));

class CommentData {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentData({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
