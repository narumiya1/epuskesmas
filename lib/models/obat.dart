// lib/app/data/models/obat_model.dart
class Obat {
  final String id;
  final String namaObat;
  final String fungsi;
  final String dosis; // Contoh: "1x sehari setelah makan"

  Obat({
    required this.id,
    required this.namaObat,
    required this.fungsi,
    required this.dosis,
  });
}
