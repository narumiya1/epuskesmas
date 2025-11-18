// lib/app/modules/rawat_inap/rawat_inap_controller.dart
import 'package:epuskesmas/models/ruangan_rawat_inap.dart';
import 'package:get/get.dart';

class RawatInapController extends GetxController {
  final RxList<RuanganRawatInap> listRuangan = <RuanganRawatInap>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyRuanganData();
  }

  void loadDummyRuanganData() {
    final dummyData = [
      RuanganRawatInap(
          id: 'R01',
          namaRuangan: 'Ruang Mawar',
          kapasitasTotal: 6,
          terisi: 6), // Full
      RuanganRawatInap(
          id: 'R02',
          namaRuangan: 'Ruang Melati',
          kapasitasTotal: 10,
          terisi: 8),
      RuanganRawatInap(
          id: 'R03',
          namaRuangan: 'Ruang Anggrek',
          kapasitasTotal: 8,
          terisi: 3),
      RuanganRawatInap(
          id: 'R04', namaRuangan: 'Ruang Tulip', kapasitasTotal: 12, terisi: 5),
      RuanganRawatInap(
          id: 'R05',
          namaRuangan: 'Ruang Lily',
          kapasitasTotal: 7,
          terisi: 7), // Full
      RuanganRawatInap(
          id: 'R06',
          namaRuangan: 'Ruang Jasmine',
          kapasitasTotal: 9,
          terisi: 2),
      RuanganRawatInap(
          id: 'R07',
          namaRuangan: 'Ruang Edelweiss',
          kapasitasTotal: 5,
          terisi: 1),
      RuanganRawatInap(
          id: 'R08',
          namaRuangan: 'Ruang Kenanga',
          kapasitasTotal: 10,
          terisi: 10), // Full
      RuanganRawatInap(
          id: 'R09',
          namaRuangan: 'Ruang Sakura',
          kapasitasTotal: 11,
          terisi: 4),
      RuanganRawatInap(
          id: 'R10',
          namaRuangan: 'Ruang Lavender',
          kapasitasTotal: 8,
          terisi: 0), // Kosong
    ];
    listRuangan.assignAll(dummyData);
  }

  // Fungsi opsional untuk mengupdate status (misal: jika ada pasien masuk/keluar)
  void updateStatusRuangan(String roomId, {bool increment = true}) {
    final index = listRuangan.indexWhere((r) => r.id == roomId);
    if (index != -1) {
      if (increment &&
          listRuangan[index].terisi < listRuangan[index].kapasitasTotal) {
        listRuangan[index].terisi++;
      } else if (!increment && listRuangan[index].terisi > 0) {
        listRuangan[index].terisi--;
      }
      listRuangan.refresh(); // Memaksa update UI
    }
  }
}
