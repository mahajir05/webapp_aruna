import 'package:get/get.dart';

import '../../../../domain/repositories/posts_repo_interface.dart';
import '../../../dal/daos/data_sources/remote_data_source.dart';
import '../../../dal/daos/repositories/posts_repo.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IRemoteDataSource>(RemoteDataSource());
    Get.put<IPostsRepo>(PostsRepo(
      remoteDataSource: Get.find(),
    ));
  }
}
