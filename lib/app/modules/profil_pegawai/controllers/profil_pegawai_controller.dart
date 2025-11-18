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
          idPegawai: '198202012010012008',
          nama: 'Dr.Kartini',
          jabatan: 'Dokter Umum'),
      Pegawai(
          idPegawai: '197408201997032003',
          nama: 'Mariyam, Str. Keb',
          jabatan: 'Bidan'),
      Pegawai(
          idPegawai: '197705062007011003',
          nama: 'Kurdi, S.Kep, Ners',
          jabatan: 'Perawat'),
      Pegawai(idPegawai: '4', nama: 'Popy Mercury, Amd. Keb', jabatan: 'Bidan'),
      Pegawai(
          idPegawai: '8',
          nama: 'Indah Wahyu Ningsih SIP',
          jabatan: 'Staf Non Medis'),
      Pegawai(
          idPegawai: '199501032022021001',
          nama: 'Dadi Hartono A.Md.Kes',
          jabatan: 'Ahli Teknologi Laboratorium Medik'),
      Pegawai(
          idPegawai: '199311062023212001',
          nama: 'Sri Sumarni',
          jabatan: ' Perekam Medis'),
      Pegawai(
          idPegawai: '50',
          nama: 'ALYA NURHANIFAH, DRG',
          jabatan: ' Dokter Gigi'), // Contoh lain
    ];
    listPegawai.assignAll(dummyData);
    listPegawai
        .sort((a, b) => a.nama.compareTo(b.nama)); // Urutkan berdasarkan nama
  }
}
