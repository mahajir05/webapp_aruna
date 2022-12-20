import '../entities/content_entity.dart';

abstract class IPostsRepo {
  Future<List<ContentEntity>?> getAllContent();
  Future<ContentEntity?> getContentById(int id);
}
