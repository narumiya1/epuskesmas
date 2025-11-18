// lib/app/modules/profil_pegawai/profil_pegawai_controller.dart
import 'package:epuskesmas/models/pegawai.dart';
import 'package:get/get.dart';

class ProfilPegawaiController extends GetxController {
  final RxList<Pegawai> listPegawai = <Pegawai>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyPegawaiData();
  }

  void loadDummyPegawaiData() {
    final dummyData = [
      Pegawai(
          idPegawai: 'P001', nama: 'Dr. Siti Aminah', jabatan: 'Dokter Umum'),
      Pegawai(
          idPegawai: 'P002',
          nama: 'Dr. Budi Santoso',
          jabatan: 'Spesialis THT'),
      Pegawai(
          idPegawai: 'P003',
          nama: 'Dr. Tania Putri',
          jabatan: 'Spesialis Anastesi'),
      Pegawai(idPegawai: 'P004', nama: 'Suster Dian', jabatan: 'Perawat'),
      Pegawai(idPegawai: 'P005', nama: 'Perawat Indra', jabatan: 'Perawat'),
      Pegawai(idPegawai: 'P006', nama: 'Andi Pratama', jabatan: 'Rekam Medik'),
      Pegawai(
          idPegawai: 'P007', nama: 'Dr. Wahyu Kusuma', jabatan: 'Dokter Umum'),
      Pegawai(
          idPegawai: 'P008',
          nama: 'Dr. Lisa Rahmawati',
          jabatan: 'Spesialis Anak'), // Contoh lain
    ];
    listPegawai.assignAll(dummyData);
    listPegawai
        .sort((a, b) => a.nama.compareTo(b.nama)); // Urutkan berdasarkan nama
  }
}
