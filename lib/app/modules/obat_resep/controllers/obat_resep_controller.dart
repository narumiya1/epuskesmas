// lib/app/modules/obat_resep/obat_resep_controller.dart
import 'package:epuskesmas/models/obat.dart';
import 'package:epuskesmas/models/resep.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk DateFormat di View

class ObatResepController extends GetxController {
  final RxList<Obat> listObat = <Obat>[].obs;
  final RxList<Resep> listResep = <Resep>[].obs; // <<< LIST BARU UNTUK RESEP

  @override
  void onInit() {
    super.onInit();
    loadDummyObatData();
    loadDummyResepData(); // <<< LOAD DATA RESEP
  }

  void loadDummyObatData() {
    final dummyData = [
      Obat(
          nama: 'Ari',
          id: 'O001',
          namaObat: 'Paracetamol',
          fungsi: 'Meredakan nyeri dan demam',
          dosis: '1-2 tablet setiap 4-6 jam'),
      Obat(
          id: 'O002',
          namaObat: 'Amoxicillin',
          nama: 'Andi',
          fungsi: 'Antibiotik untuk infeksi bakteri',
          dosis: '3x sehari 1 tablet'),
      Obat(
          nama: 'Fatma',
          id: 'O003',
          namaObat: 'Mylanta',
          fungsi: 'Mengatasi sakit maag dan asam lambung',
          dosis: '3x sehari 1-2 sendok takar'),
      Obat(
          nama: 'Sri',
          id: 'O004',
          namaObat: 'Cough Syrup',
          fungsi: 'Meredakan batuk',
          dosis: '3x sehari 1 sendok takar'),
    ];
    listObat.assignAll(dummyData);
  }

  void loadDummyResepData() {
    final dummyData = [
      Resep(
        nama: 'Sri',
        id: 'RSP001',
        namaDokter: 'Dr. Ahmad Budiman',
        tanggalResep: DateTime(2025, 11, 15),
        detailResep: 'Amoxicillin 500mg (1x sehari) dan Vitamin C (2x sehari)',
      ),
      Resep(
        nama: 'Fatma',
        id: 'RSP002',
        namaDokter: 'Dr. Rina Sari',
        tanggalResep: DateTime(2025, 10, 28),
        detailResep: 'Paracetamol (Jika demam) dan Oralit (Untuk diare)',
      ),
      Resep(
        nama: 'Ari',
        id: 'RSP003',
        namaDokter: 'Dr. Bima Sakti',
        tanggalResep: DateTime(2025, 09, 10),
        detailResep: 'Obat Batuk Syrup dan Imunomodulator',
      ),
    ];
    listResep.assignAll(dummyData);
    listResep.sort((a, b) =>
        b.tanggalResep.compareTo(a.tanggalResep)); // Urutkan dari terbaru
  }

  void uploadResepDokter() {
    Get.defaultDialog(
      title: "Upload Resep",
      content: const Column(
        children: [
          Text("Fungsi upload resep akan diimplementasikan di sini."),
          SizedBox(height: 10),
          Icon(Icons.upload_file, size: 50, color: Colors.teal),
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
