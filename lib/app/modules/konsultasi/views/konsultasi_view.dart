import 'package:epuskesmas/app/modules/konsultasi/controllers/konsultasi_controller.dart';
import 'package:epuskesmas/models/dokter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  const KonsultasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi Dokter'),
        backgroundColor: const Color.fromARGB(255, 164, 182, 201),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Daftar Dokter yang Tersedia:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              // Gunakan Obx untuk merefresh tampilan saat data listDokter berubah
              child: Obx(() {
                if (controller.listDokter.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.listDokter.length,
                  itemBuilder: (context, index) {
                    final dokter = controller.listDokter[index];
                    return _buildDokterCard(dokter);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDokterCard(Dokter dokter) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.person, size: 30, color: Colors.blue),
        ),
        title: Text(
          dokter.nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              "Spesialis: ${dokter.spesialis}",
              style: TextStyle(
                  color: Colors.blue.shade700, fontWeight: FontWeight.w600),
            ),
            Text("ID: ${dokter.id}"),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 5),
                Text(dokter.hariPraktik, style: const TextStyle(fontSize: 12)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 5),
                Text(dokter.jamPraktik, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () => controller.pilihDokter(dokter),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Pilih', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
