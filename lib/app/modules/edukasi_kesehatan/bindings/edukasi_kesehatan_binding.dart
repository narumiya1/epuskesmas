import 'package:get/get.dart';

import '../controllers/edukasi_kesehatan_controller.dart';

class EdukasiKesehatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EdukasiKesehatanController>(
      () => EdukasiKesehatanController(),
    );
  }
}
