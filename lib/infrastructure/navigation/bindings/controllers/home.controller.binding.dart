import 'package:get/get.dart';

import '../../../../domain/usecases/posts/get_content_uc.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetContentsUc(repo: Get.find()));
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
