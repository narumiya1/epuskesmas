import 'package:get/get.dart';

import '../controllers/obat_resep_controller.dart';

class ObatResepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ObatResepController>(
      () => ObatResepController(),
    );
  }
}
