// lib/app/modules/riwayat_medis/riwayat_medis_controller.dart
import 'package:epuskesmas/models/riwayat_medis.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Untuk DateFormat

class RiwayatMedisController extends GetxController {
  final RxList<RiwayatMedis> listRiwayat = <RiwayatMedis>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyRiwayatData();
  }

  void loadDummyRiwayatData() {
    final dummyData = [
      RiwayatMedis(
        id: 'RM001',
        tanggalKunjungan: DateTime(2023, 10, 15),
        dokter: 'Dr. Ahmad Budiman',
        diagnosis: 'Batuk Pilek Akut',
        tindakan: 'Resep obat Paracetamol dan Vitamin C',
      ),
      RiwayatMedis(
        id: 'RM002',
        tanggalKunjungan: DateTime(2023, 08, 22),
        dokter: 'Dr. Rina Sari',
        diagnosis: 'Infeksi Telinga Ringan',
        tindakan: 'Resep antibiotik Amoxicillin',
      ),
      RiwayatMedis(
        id: 'RM003',
        tanggalKunjungan: DateTime(2023, 05, 01),
        dokter: 'Dr. Bima Sakti',
        diagnosis: 'Demam Berdarah Dengue',
        tindakan: 'Rawat jalan, istirahat total, banyak minum cairan',
      ),
    ];
    listRiwayat.assignAll(dummyData);
    listRiwayat.sort((a, b) => b.tanggalKunjungan
        .compareTo(a.tanggalKunjungan)); // Urutkan dari terbaru
  }
}
