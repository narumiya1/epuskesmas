// lib/app/modules/edukasi_kesehatan/edukasi_kesehatan_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edukasi_kesehatan_controller.dart';
import 'package:epuskesmas/models/artikel.dart';

class EdukasiKesehatanView extends GetView<EdukasiKesehatanController> {
  const EdukasiKesehatanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukasi Kesehatan'),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Artikel & Tips Kesehatan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.listArtikel.isEmpty) {
                  return const Center(
                      child: Text("Tidak ada artikel tersedia."));
                }
                return ListView.builder(
                  itemCount: controller.listArtikel.length,
                  itemBuilder: (context, index) {
                    final artikel = controller.listArtikel[index];
                    return _buildArtikelCard(artikel);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtikelCard(Artikel artikel) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          artikel.judul,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            artikel.ringkasan,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: () => controller.showArtikelDetail(artikel),
      ),
    );
  }
}
