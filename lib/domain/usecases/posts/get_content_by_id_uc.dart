import '../../core/usecases/usecase.dart';
import '../../entities/content_entity.dart';
import '../../repositories/posts_repo_interface.dart';

class GetContentByIdUc extends UseCase<ContentEntity?, int> {
  final IPostsRepo repo;

  GetContentByIdUc({required this.repo});

  @override
  Future<ContentEntity?> call(int params, [bool isPrototype = false]) {
    return repo.getContentById(params);
  }
}
