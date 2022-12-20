import 'package:get/get.dart';

import '../../../domain/core/usecases/usecase.dart';
import '../../../domain/entities/content_entity.dart';
import '../../../domain/usecases/posts/get_content_uc.dart';

class HomeController extends GetxController {
  GetContentsUc getContentsUc = Get.find();

  RxBool isLoading = false.obs;
  Rx<List<ContentEntity>?> contents = Rxn<List<ContentEntity>>();
  Rx<List<ContentEntity>?> contentsShowing = Rxn<List<ContentEntity>>();

  @override
  void onInit() {
    super.onInit();
    getAllContent();
  }

  void getAllContent() async {
    isLoading.value = true;
    var res = await getContentsUc(NoParams());
    contents.value = res;
    contentsShowing.value = res;
    isLoading.value = false;
  }

  void search(String keyword) {
    var res = contents.value
        ?.where((element) => (element.title ?? '').contains(keyword) || (element.body ?? '').contains(keyword));
    contentsShowing.value = res?.toList();
  }
}
