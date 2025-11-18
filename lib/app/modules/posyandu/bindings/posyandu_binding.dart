import 'package:get/get.dart';

import '../controllers/posyandu_controller.dart';

class PosyanduBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosyanduController>(
      () => PosyanduController(),
    );
  }
}
