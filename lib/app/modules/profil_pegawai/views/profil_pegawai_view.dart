// lib/app/modules/profil_pegawai/profil_pegawai_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_pegawai_controller.dart';
import 'package:epuskesmas/models/pegawai.dart';

class ProfilPegawaiView extends GetView<ProfilPegawaiController> {
  const ProfilPegawaiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pegawai'),
        backgroundColor:
            Colors.deepOrange.shade800, // Sesuaikan warna jika perlu
        leading: IconButton(
          // Tombol back manual jika tidak otomatis muncul
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Pegawai Puskesmas:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listPegawai.isEmpty) {
                  return const Center(child: Text("Tidak ada data pegawai."));
                }
                return ListView.builder(
                  itemCount: controller.listPegawai.length,
                  itemBuilder: (context, index) {
                    final pegawai = controller.listPegawai[index];
                    return _buildPegawaiCard(pegawai);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPegawaiCard(Pegawai pegawai) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrange.shade100,
          child: const Icon(Icons.person_outline, color: Colors.deepOrange),
        ),
        title: Text(
          pegawai.nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              "Jabatan: ${pegawai.jabatan}",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            Text(
              "ID Pegawai: ${pegawai.idPegawai}",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ),
        onTap: () {
          // Aksi ketika kartu pegawai diklik (opsional)
          Get.snackbar('Detail Pegawai', 'Anda melihat profil ${pegawai.nama}',
              snackPosition: SnackPosition.BOTTOM);
        },
      ),
    );
  }
}
