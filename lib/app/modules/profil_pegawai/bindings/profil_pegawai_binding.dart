import 'package:get/get.dart';

import '../controllers/profil_pegawai_controller.dart';

class ProfilPegawaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilPegawaiController>(
      () => ProfilPegawaiController(),
    );
  }
}
