// lib/app/modules/edukasi_kesehatan/edukasi_kesehatan_controller.dart
import 'package:epuskesmas/models/artikel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Untuk Get.defaultDialog

class EdukasiKesehatanController extends GetxController {
  final RxList<Artikel> listArtikel = <Artikel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyArtikelData();
  }

  void loadDummyArtikelData() {
    final dummyData = [
      Artikel(
        id: 'A001',
        judul: 'Pentingnya Vaksinasi Lengkap pada Anak',
        ringkasan: 'Membahas manfaat dan jadwal vaksinasi wajib untuk anak.',
        isiLengkap:
            'Vaksinasi adalah salah satu intervensi kesehatan masyarakat yang paling efektif untuk mencegah penyakit menular. Pastikan anak Anda mendapatkan semua vaksinasi sesuai jadwal... [Isi lengkap artikel di sini]',
      ),
      Artikel(
        id: 'A002',
        judul: 'Tips Hidup Sehat di Era Digital',
        ringkasan:
            'Panduan menjaga kesehatan fisik dan mental di tengah kesibukan online.',
        isiLengkap:
            'Di era digital saat ini, penting untuk tetap menjaga keseimbangan. Batasi waktu layar, luangkan waktu untuk bergerak, dan perhatikan pola makan Anda... [Isi lengkap artikel di sini]',
      ),
      Artikel(
        id: 'A003',
        judul: 'Mengenali Gejala Awal Diabetes dan Cara Pencegahannya',
        ringkasan:
            'Informasi penting tentang gejala diabetes dan langkah-langkah pencegahan.',
        isiLengkap:
            'Diabetes adalah kondisi kronis yang memengaruhi cara tubuh mengubah makanan menjadi energi. Kenali gejala seperti sering haus, sering buang air kecil, dan kelelahan... [Isi lengkap artikel di sini]',
      ),
    ];
    listArtikel.assignAll(dummyData);
  }

  void showArtikelDetail(Artikel artikel) {
    Get.defaultDialog(
      title: artikel.judul,
      content: SingleChildScrollView(
        // Agar konten bisa di-scroll jika panjang
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(artikel.isiLengkap, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Text(
              'Sumber: Puskesmas',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
      textConfirm: "Tutup",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
}
