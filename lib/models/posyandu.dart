// lib/app/data/models/posyandu_model.dart
class PosyanduJadwal {
  final String namaTempat;
  final DateTime tanggal;
  final String jam;
  final String kegiatan;

  PosyanduJadwal({
    required this.namaTempat,
    required this.tanggal,
    required this.jam,
    required this.kegiatan,
  });
}
