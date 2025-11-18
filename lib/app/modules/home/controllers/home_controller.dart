import 'package:epuskesmas/models/menu_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // List data menu sesuai gambar
  final List<MenuModel> menuList = [
    MenuModel(
      title: 'Jadwal Dokter',
      description: '',
      icon: Icons.person_3, // Placeholder icon
      color: Colors.yellow.shade100,
      route: '/konsultasi',
    ),
    MenuModel(
      title: 'Posyandu',
      description: '',
      icon: Icons.pregnant_woman_outlined, // Placeholder icon
      color: Colors.cyan.shade100,
      route: '/posyandu',
    ),
    MenuModel(
      title: 'Obat dan Resep',
      description: '',
      icon: Icons.medical_information, // Placeholder icon
      color: Colors.lightBlue.shade100,
      route: '/obat-resep',
    ),
    MenuModel(
      title: 'Riwayat Medis',
      description: '',
      icon: Icons.history_toggle_off, // Placeholder icon
      color: Colors.blue.shade100,
      route: '/riwayat-medis',
    ),
    MenuModel(
      title: 'Rawat Inap',
      description: '',
      icon: Icons.local_hospital, // Placeholder icon
      color: Colors.blue.shade100,
      route: '/rawat-inap',
    ),
    MenuModel(
      title: 'Profil Pegawai',
      description: '',
      icon: Icons.person_3_outlined, // Placeholder icon
      color: Color.fromARGB(255, 210, 109, 235),
      route: '/profil-pegawai',
    ),
    MenuModel(
      title: 'Edukasi Kesehatan',
      description: '',
      icon: Icons.people_alt_outlined, // Placeholder icon
      color: Colors.green.shade100,
      route: '/edukasi-kesehatan',
    ),
    MenuModel(
      title: 'Kontak Darurat',
      description: '',
      icon: Icons.phone_in_talk_outlined, // Placeholder icon
      color: Colors.red.shade100,
      route: '/kontak-darurat',
    ),
  ];

  // Fungsi navigasi yang akan dipanggil saat kartu diklik
  void navigateTo(String route) {
    // Implementasi navigasi ke halaman/rute tujuan
    print('Navigasi ke $route');
    Get.toNamed(route);

    // Contoh: Anda akan perlu mendaftarkan rute ini di GetMaterialApp
    // Get.snackbar('Navigasi', 'Menuju ke $route');
  }
}
