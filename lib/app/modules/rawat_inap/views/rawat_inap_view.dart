// lib/app/modules/rawat_inap/rawat_inap_view.dart
import 'package:epuskesmas/models/ruangan_rawat_inap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rawat_inap_controller.dart';

class RawatInapView extends GetView<RawatInapController> {
  const RawatInapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Rawat Inap'),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Ruangan Rawat Inap:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listRuangan.isEmpty) {
                  return const Center(
                      child: Text("Tidak ada data ruangan rawat inap."));
                }
                return ListView.builder(
                  itemCount: controller.listRuangan.length,
                  itemBuilder: (context, index) {
                    final ruangan = controller.listRuangan[index];
                    return _buildRuanganCard(ruangan);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuanganCard(RuanganRawatInap ruangan) {
    Color statusColor = ruangan.isFull
        ? Colors.red.shade700
        : (ruangan.kapasitasKosong <= 2
            ? Colors.orange.shade700
            : Colors.green.shade700);
    String statusText =
        ruangan.isFull ? 'PENUH' : 'Kosong: ${ruangan.kapasitasKosong}';
    IconData statusIcon =
        ruangan.isFull ? Icons.warning : Icons.check_circle_outline;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ruangan.namaRuangan,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, size: 16, color: statusColor),
                      const SizedBox(width: 5),
                      Text(
                        statusText,
                        style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 15, thickness: 1),
            Text(
              "ID Ruangan: ${ruangan.id}",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              "Kapasitas: ${ruangan.terisi}/${ruangan.kapasitasTotal}",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
