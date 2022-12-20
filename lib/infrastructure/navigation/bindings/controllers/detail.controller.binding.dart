import 'package:get/get.dart';

import '../../../../domain/usecases/posts/get_content_by_id_uc.dart';
import '../../../../presentation/detail/controllers/detail.controller.dart';

class DetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetContentByIdUc(repo: Get.find()));
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
