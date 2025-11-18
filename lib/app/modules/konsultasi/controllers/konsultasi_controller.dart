import 'package:epuskesmas/models/dokter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonsultasiController extends GetxController {
  // RxList untuk menampung data dokter secara reaktif
  final RxList<Dokter> listDokter = <Dokter>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyDokterData();
  }

  void loadDummyDokterData() {
    // Data Dummy Dokter sesuai permintaan
    final dummyData = [
      Dokter(
        id: 'D001',
        nama: 'Dr. Ahmad Budiman',
        spesialis: 'Umum',
        hariPraktik: 'Senin - Jumat',
        jamPraktik: '08:00 - 16:00',
      ),
      Dokter(
        id: 'D002',
        nama: 'Dr. Rina Sari',
        spesialis: 'THT',
        hariPraktik: 'Selasa & Kamis',
        jamPraktik: '10:00 - 14:00',
      ),
      Dokter(
        id: 'D003',
        nama: 'Dr. Chandra Wijaya',
        spesialis: 'Anestesi',
        hariPraktik: 'Rabu & Jumat',
        jamPraktik: '14:00 - 18:00',
      ),
      Dokter(
        id: 'D004',
        nama: 'Dr. Larasati Ayu',
        spesialis: 'Psikiatri',
        hariPraktik: 'Senin - Rabu',
        jamPraktik: '09:00 - 12:00',
      ),
      Dokter(
        id: 'D005',
        nama: 'Dr. Bima Sakti',
        spesialis: 'Umum',
        hariPraktik: 'Senin - Sabtu',
        jamPraktik: '17:00 - 20:00',
      ),
    ];
    listDokter.assignAll(dummyData);
  }

  // Contoh fungsi yang bisa dipanggil saat memilih dokter
  void pilihDokter(Dokter dokter) {
    Get.snackbar(
      'Pilih Dokter',
      'Anda memilih ${dokter.nama} (${dokter.spesialis}).',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    // Di sini Anda bisa menavigasi ke halaman booking/detail
    // Get.toNamed('/booking_dokter', arguments: dokter);
  }
}
