// lib/app/modules/obat_resep/obat_resep_view.dart
import 'package:epuskesmas/models/obat.dart';
import 'package:epuskesmas/models/resep.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Untuk memformat tanggal
import '../controllers/obat_resep_controller.dart';

class ObatResepView extends GetView<ObatResepController> {
  const ObatResepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obat dan Resep'),
        backgroundColor: Colors.lightBlue.shade800,
        // Tombol Upload Resep diletakkan di action AppBar agar selalu terlihat
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: ElevatedButton.icon(
        //       onPressed: () => controller.uploadResepDokter(),
        //       icon: const Icon(Icons.cloud_upload, size: 18),
        //       label: const Text('Upload Resep', style: TextStyle(fontSize: 13)),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.teal,
        //         foregroundColor: Colors.white,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8)),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.uploadResepDokter(),
        icon: const Icon(Icons.cloud_upload),
        label: const Text('Upload Resep'),
        backgroundColor: Colors.teal, // Warna yang menonjol
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================================================
            // BAGIAN 1: DAFTAR OBAT TERSEDIA
            // =========================================================
            const Text(
              "💊 Daftar Obat Tersedia",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            const Divider(thickness: 2, color: Colors.lightBlue),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.listObat.isEmpty) {
                return const Center(child: Text("Tidak ada data obat."));
              }
              // Menggunakan Column/ListView.builder agar data obat ditampilkan berurutan
              return Column(
                children: controller.listObat
                    .map((obat) => _buildObatCard(obat))
                    .toList(),
              );
            }),
            const SizedBox(height: 30),

            // =========================================================
            // BAGIAN 2: RIWAYAT RESEP DOKTER
            // =========================================================
            const Text(
              "📝 Riwayat Resep Dokter",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
            const Divider(thickness: 2, color: Colors.redAccent),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.listResep.isEmpty) {
                return const Center(
                    child: Text("Tidak ada riwayat resep dokter."));
              }
              // Menggunakan Column/ListView.builder agar data resep ditampilkan berurutan
              return Column(
                children: controller.listResep
                    .map((resep) => _buildResepCard(resep))
                    .toList(),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildObatCard(Obat obat) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              obat.namaObat,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            const Divider(height: 15, thickness: 1),
            Text("Fungsi: ${obat.fungsi}",
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            Text("Dosis: ${obat.dosis}",
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildResepCard(Resep resep) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
            color: Colors.redAccent, width: 1), // Border untuk penekanan
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd MMMM yyyy', 'id').format(resep.tanggalResep),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                Text(
                  "Dokter: ${resep.namaDokter}",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            const Divider(height: 10, thickness: 1),
            const Text(
              "Detail Resep:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              resep.detailResep,
              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            Text(
              'Nama: ${resep.nama}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
