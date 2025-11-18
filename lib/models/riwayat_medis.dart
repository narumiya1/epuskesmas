// lib/app/data/models/riwayat_medis_model.dart
class RiwayatMedis {
  final String id;
  final DateTime tanggalKunjungan;
  final String dokter;
  final String diagnosis;
  final String tindakan;

  RiwayatMedis({
    required this.id,
    required this.tanggalKunjungan,
    required this.dokter,
    required this.diagnosis,
    required this.tindakan,
  });
}
