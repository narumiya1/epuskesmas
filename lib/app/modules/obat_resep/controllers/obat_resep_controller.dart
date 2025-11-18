// lib/app/modules/obat_resep/obat_resep_controller.dart
import 'package:epuskesmas/models/obat.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Untuk Get.defaultDialog

class ObatResepController extends GetxController {
  final RxList<Obat> listObat = <Obat>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyObatData();
  }

  void loadDummyObatData() {
    final dummyData = [
      Obat(
          id: 'O001',
          namaObat: 'Paracetamol',
          fungsi: 'Meredakan nyeri dan demam',
          dosis: '1-2 tablet setiap 4-6 jam'),
      Obat(
          id: 'O002',
          namaObat: 'Amoxicillin',
          fungsi: 'Antibiotik untuk infeksi bakteri',
          dosis: '3x sehari 1 tablet'),
      Obat(
          id: 'O003',
          namaObat: 'Mylanta',
          fungsi: 'Mengatasi sakit maag dan asam lambung',
          dosis: '3x sehari 1-2 sendok takar'),
      Obat(
          id: 'O004',
          namaObat: 'Cough Syrup',
          fungsi: 'Meredakan batuk',
          dosis: '3x sehari 1 sendok takar'),
    ];
    listObat.assignAll(dummyData);
  }

  void uploadResepDokter() {
    Get.defaultDialog(
      title: "Upload Resep",
      content: const Column(
        children: [
          Text("Fungsi upload resep akan diimplementasikan di sini."),
          SizedBox(height: 10),
          // Tambahkan widget untuk memilih gambar/file di sini
          Icon(Icons.upload_file, size: 50, color: Colors.blue),
        ],
      ),
      textConfirm: "OK",
      onConfirm: () {
        Get.back();
        Get.snackbar('Info', 'Resep berhasil diupload (simulasi)!',
            snackPosition: SnackPosition.BOTTOM);
      },
      textCancel: "Batal",
      onCancel: () => Get.back(),
    );
  }
}
