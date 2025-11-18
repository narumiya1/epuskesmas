// lib/app/data/models/pegawai_model.dart
class Pegawai {
  final String idPegawai;
  final String nama;
  final String jabatan; // Contoh: "Dokter Umum", "Perawat", "Spesialis THT"

  Pegawai({
    required this.idPegawai,
    required this.nama,
    required this.jabatan,
  });
}
