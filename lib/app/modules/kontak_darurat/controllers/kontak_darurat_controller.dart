// lib/app/modules/kontak_darurat/kontak_darurat_controller.dart
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart'; // Untuk memanggil telepon
import 'package:flutter/services.dart'; // Untuk menyalin ke clipboard
import 'package:epuskesmas/models/kontak_darurat.dart';

class KontakDaruratController extends GetxController {
  final RxList<KontakDarurat> listKontak = <KontakDarurat>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyKontakData();
  }

  void loadDummyKontakData() {
    final dummyData = [
      KontakDarurat(
          namaLayanan: 'Puskesmas Utama',
          nomorTelepon: '022720911',
          deskripsi: 'Hubungi untuk informasi umum dan janji temu'),
      KontakDarurat(
          namaLayanan: 'Polisi (Darurat)',
          nomorTelepon: '110',
          deskripsi: 'Situasi darurat atau kejahatan'),
      KontakDarurat(
          namaLayanan: 'Ambulans (Darurat)',
          nomorTelepon: '118',
          deskripsi: 'Keadaan darurat medis'),
      KontakDarurat(
          namaLayanan: 'Pemadam Kebakaran',
          nomorTelepon: '113',
          deskripsi: 'Kebakaran atau keadaan bahaya lainnya'),
      KontakDarurat(
          namaLayanan: 'KLINIK SEHAT JAYA',
          nomorTelepon: '081234567890',
          deskripsi: 'Informasi dan jadwal praktik klinik'),
    ];
    listKontak.assignAll(dummyData);
  }

  void callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      Get.snackbar('Error', 'Tidak dapat melakukan panggilan ke $phoneNumber',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void copyNumber(String phoneNumber) {
    Clipboard.setData(ClipboardData(text: phoneNumber));
    Get.snackbar('Berhasil', 'Nomor $phoneNumber disalin ke clipboard.',
        snackPosition: SnackPosition.BOTTOM);
  }
}
