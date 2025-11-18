class Dokter {
  final String id;
  final String nama;
  final String spesialis;
  final String hariPraktik; // Contoh: "Senin - Jumat"
  final String jamPraktik; // Contoh: "08:00 - 16:00"

  Dokter({
    required this.id,
    required this.nama,
    required this.spesialis,
    required this.hariPraktik,
    required this.jamPraktik,
  });
}
