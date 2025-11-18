import 'package:flutter/material.dart';

class MenuModel {
  final String title;
  final String description;
  final IconData icon; // Menggunakan IconData sebagai placeholder
  final Color color; // Warna untuk background ikon/kartu
  final String route; // Rute GetX

  MenuModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
  });
}
