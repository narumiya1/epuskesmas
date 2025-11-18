// lib/app/modules/posyandu/posyandu_view.dart
import 'package:epuskesmas/models/posyandu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import untuk format tanggal
import '../controllers/posyandu_controller.dart';

class PosyanduView extends GetView<PosyanduController> {
  const PosyanduView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Posyandu'),
        backgroundColor: Colors.cyan.shade800, // Sesuaikan warna
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  "Jadwal Posyandu ${controller.currentMonthYear.value}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(() {
                if (controller.listJadwal.isEmpty) {
                  return const Center(
                      child:
                          Text("Tidak ada jadwal posyandu untuk bulan ini."));
                }
                return ListView.builder(
                  itemCount: controller.listJadwal.length,
                  itemBuilder: (context, index) {
                    final jadwal = controller.listJadwal[index];
                    return _buildJadwalCard(jadwal);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJadwalCard(PosyanduJadwal jadwal) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id').format(jadwal.tanggal),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
            const Divider(height: 15, thickness: 1),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    jadwal.namaTempat,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 18, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  jadwal.jam,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 18, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Kegiatan: ${jadwal.kegiatan}",
                    style: const TextStyle(fontSize: 15),
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
