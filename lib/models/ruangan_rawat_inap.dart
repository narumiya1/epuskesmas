// lib/app/data/models/rawat_inap_model.dart
class RuanganRawatInap {
  final String id;
  final String namaRuangan;
  final int kapasitasTotal;
  int terisi; // Properti ini bisa berubah, jadi tidak final

  RuanganRawatInap({
    required this.id,
    required this.namaRuangan,
    required this.kapasitasTotal,
    this.terisi = 0, // Defaultnya 0 terisi
  });

  // Getter untuk mendapatkan sisa kapasitas kosong
  int get kapasitasKosong => kapasitasTotal - terisi;

  // Getter untuk mengecek apakah ruangan penuh
  bool get isFull => terisi >= kapasitasTotal;
}
