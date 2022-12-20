import '../../../../domain/entities/content_entity.dart';

class ContentModel extends ContentEntity {
  ContentModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) : super(userId: userId, id: id, title: title);

  ContentModel.fromJson(Map<String, dynamic> json)
      : super(
          userId: json['userId'],
          id: json['id'],
          title: json['title'],
          body: json['body'],
        );
}
