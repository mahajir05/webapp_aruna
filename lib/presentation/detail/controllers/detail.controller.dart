import 'package:get/get.dart';

import '../../../domain/entities/content_entity.dart';
import '../../../domain/usecases/posts/get_content_by_id_uc.dart';
import '../../../infrastructure/navigation/routes.dart';

class DetailController extends GetxController {
  GetContentByIdUc getContentByIdUc = Get.find();

  Rx<ContentEntity?> selectedContent = Rxn<ContentEntity>();

  @override
  void onInit() {
    super.onInit();
    var contentId = Get.rootDelegate.parameters['id'];
    getSelectedContent(contentId!);
  }

  void getSelectedContent(String contentId) async {
    var res = await getContentByIdUc(int.tryParse(contentId) ?? 0);
    selectedContent.value = res;
  }

  void goToNextContent() async {
    int id = (int.tryParse(Get.rootDelegate.parameters['id']!) ?? 0);
    int nextId = id + 1;
    var res = await getContentByIdUc(nextId);
    if (res != null) {
      selectedContent.value = res;
      Get.rootDelegate.offNamed(Routes.DETAIL, parameters: {'id': '$nextId'});
    }
  }

  void goToPrevContent() async {
    int id = (int.tryParse(Get.rootDelegate.parameters['id']!) ?? 0);
    if (id > 1) {
      int prevId = id - 1;
      var res = await getContentByIdUc(prevId);
      selectedContent.value = res;
      Get.rootDelegate.offNamed(Routes.DETAIL, parameters: {'id': '$prevId'});
    }
  }
}
