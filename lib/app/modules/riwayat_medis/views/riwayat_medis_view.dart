// lib/app/modules/riwayat_medis/riwayat_medis_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/riwayat_medis_controller.dart';
import 'package:epuskesmas/models/riwayat_medis.dart';

class RiwayatMedisView extends GetView<RiwayatMedisController> {
  const RiwayatMedisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Medis'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Riwayat Kunjungan Anda:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listRiwayat.isEmpty) {
                  return const Center(child: Text("Tidak ada riwayat medis."));
                }
                return ListView.builder(
                  itemCount: controller.listRiwayat.length,
                  itemBuilder: (context, index) {
                    final riwayat = controller.listRiwayat[index];
                    return _buildRiwayatCard(riwayat);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiwayatCard(RiwayatMedis riwayat) {
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
              DateFormat('dd MMMM yyyy', 'id').format(riwayat.tanggalKunjungan),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const Divider(height: 15, thickness: 1),
            Text("Dokter: ${riwayat.dokter}",
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            Text("Diagnosis: ${riwayat.diagnosis}",
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            Text("Tindakan: ${riwayat.tindakan}",
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
