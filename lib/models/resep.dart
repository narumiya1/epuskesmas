// lib/app/data/models/resep_model.dart
class Resep {
  final String id;
  final String namaDokter;
  final DateTime tanggalResep;
  final String detailResep; // Isi resep atau daftar obat
  final String nama;

  Resep({
    required this.id,
    required this.namaDokter,
    required this.tanggalResep,
    required this.detailResep,
    required this.nama,
  });
}
