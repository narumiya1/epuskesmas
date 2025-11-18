// lib/app/modules/posyandu/posyandu_controller.dart
import 'package:epuskesmas/models/posyandu.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import untuk format tanggal

class PosyanduController extends GetxController {
  final RxList<PosyanduJadwal> listJadwal = <PosyanduJadwal>[].obs;
  final RxString currentMonthYear = ''.obs; // Untuk menampilkan "November 2023"

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi bulan saat ini
    final now = DateTime.now();
    currentMonthYear.value =
        DateFormat('MMMM yyyy', 'id').format(now); // Format bahasa Indonesia

    loadJadwalPosyanduForCurrentMonth(now);
  }

  void loadJadwalPosyanduForCurrentMonth(DateTime now) {
    listJadwal.clear(); // Bersihkan daftar jadwal sebelumnya

    // Contoh data dummy, bisa Anda sesuaikan
    final List<Map<String, dynamic>> dummyData = [
      {
        'day': 5,
        'tempat': 'Balai Desa A',
        'jam': '09:00 - 12:00',
        'kegiatan': 'Pemeriksaan Ibu Hamil'
      },
      {
        'day': 12,
        'tempat': 'RW 03 - Posyandu Melati',
        'jam': '08:30 - 11:30',
        'kegiatan': 'Imunisasi Balita'
      },
      {
        'day': 20,
        'tempat': 'Puskesmas Pembantu B',
        'jam': '13:00 - 16:00',
        'kegiatan': 'Penyuluhan Gizi Anak'
      },
      {
        'day': 25,
        'tempat': 'Balai Desa A',
        'jam': '09:00 - 12:00',
        'kegiatan': 'Pemeriksaan Balita'
      },
    ];

    // Filter jadwal yang sesuai dengan bulan saat ini
    for (var data in dummyData) {
      // Buat tanggal untuk bulan berjalan
      final jadwalDate = DateTime(now.year, now.month, data['day']);

      // Pastikan tanggal yang dibuat tidak melebihi jumlah hari dalam bulan tersebut
      if (jadwalDate.month == now.month &&
          jadwalDate.day <= DateTime(now.year, now.month + 1, 0).day) {
        listJadwal.add(
          PosyanduJadwal(
            namaTempat: data['tempat'],
            tanggal: jadwalDate,
            jam: data['jam'],
            kegiatan: data['kegiatan'],
          ),
        );
      }
    }
    // Urutkan berdasarkan tanggal jika diperlukan
    listJadwal.sort((a, b) => a.tanggal.compareTo(b.tanggal));

    if (listJadwal.isEmpty) {
      Get.snackbar(
          'Info', 'Tidak ada jadwal Posyandu untuk ${currentMonthYear.value}.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
