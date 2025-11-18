import 'package:get/get.dart';

import '../controllers/rawat_inap_controller.dart';

class RawatInapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RawatInapController>(
      () => RawatInapController(),
    );
  }
}
