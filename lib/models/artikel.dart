// lib/app/data/models/artikel_model.dart
class Artikel {
  final String id;
  final String judul;
  final String ringkasan;
  final String isiLengkap; // Bisa berupa teks panjang atau link

  Artikel({
    required this.id,
    required this.judul,
    required this.ringkasan,
    required this.isiLengkap,
  });
}
