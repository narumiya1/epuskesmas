// lib/app/modules/obat_resep/obat_resep_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/obat_resep_controller.dart';
import 'package:epuskesmas/models/obat.dart';

class ObatResepView extends GetView<ObatResepController> {
  const ObatResepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obat dan Resep'),
        backgroundColor: Colors.lightBlue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () => controller.uploadResepDokter(),
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Upload Resep Dokter'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Daftar Obat Tersedia:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listObat.isEmpty) {
                  return const Center(child: Text("Tidak ada data obat."));
                }
                return ListView.builder(
                  itemCount: controller.listObat.length,
                  itemBuilder: (context, index) {
                    final obat = controller.listObat[index];
                    return _buildObatCard(obat);
                  },
                );
              }),
            ),
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
}
