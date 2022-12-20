import '../../core/usecases/usecase.dart';
import '../../entities/content_entity.dart';
import '../../repositories/posts_repo_interface.dart';

class GetContentsUc extends UseCase<List<ContentEntity>?, NoParams> {
  final IPostsRepo repo;

  GetContentsUc({required this.repo});

  @override
  Future<List<ContentEntity>?> call(NoParams params, [bool isPrototype = false]) {
    return repo.getAllContent();
  }
}
