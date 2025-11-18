import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:epuskesmas/models/menu_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pastikan controller sudah terdaftar (misalnya melalui Get.put atau Binding)
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hapus tombol back default
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const Icon(Icons.menu, color: Colors.black),
            const Spacer(),
            // Tambahkan logo atau nama app di tengah
            const Text(
              '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Judul "Puskesmas" di bawah AppBar (Opsional, tergantung desain)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Puskesmas',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Grid Menu
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio:
                      0.99, // Rasio aspek untuk membuat kartu lebih tinggi
                ),
                itemCount: controller.menuList.length,
                itemBuilder: (context, index) {
                  final menu = controller.menuList[index];
                  return _buildMenuItem(menu);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(MenuModel menu) {
    return GestureDetector(
      onTap: () => controller.navigateTo(menu.route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Bulat dengan Warna
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: menu.color, // Warna background dari model
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    menu.icon,
                    size: 30,
                    color: Colors.black, // Atur warna ikon
                  ),
                ),
                const SizedBox(height: 15),
                // Judul Menu
                Text(
                  menu.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Deskripsi (jika ada)
                Text(
                  textAlign: TextAlign.center,
                  menu.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
