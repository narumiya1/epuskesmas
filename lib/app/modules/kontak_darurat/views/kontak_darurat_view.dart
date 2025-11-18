// lib/app/modules/kontak_darurat/kontak_darurat_view.dart
import 'package:epuskesmas/app/modules/kontak_darurat/controllers/kontak_darurat_controller.dart';
import 'package:epuskesmas/models/kontak_darurat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KontakDaruratView extends GetView<KontakDaruratController> {
  const KontakDaruratView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Darurat'),
        backgroundColor: Colors.red.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Kontak Penting:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listKontak.isEmpty) {
                  return const Center(child: Text("Tidak ada kontak darurat."));
                }
                return ListView.builder(
                  itemCount: controller.listKontak.length,
                  itemBuilder: (context, index) {
                    final kontak = controller.listKontak[index];
                    return _buildKontakCard(kontak);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKontakCard(KontakDarurat kontak) {
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
              kontak.namaLayanan,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Divider(height: 15, thickness: 1),
            Text("Nomor: ${kontak.nomorTelepon}",
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            Text(kontak.deskripsi,
                style: const TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => controller.copyNumber(kontak.nomorTelepon),
                  icon: const Icon(Icons.copy, size: 18),
                  label: const Text('Salin'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => controller.callNumber(kontak.nomorTelepon),
                  icon: const Icon(Icons.call, size: 18),
                  label: const Text('Telepon'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
