import 'package:get/get.dart';

import '../modules/edukasi_kesehatan/bindings/edukasi_kesehatan_binding.dart';
import '../modules/edukasi_kesehatan/views/edukasi_kesehatan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/konsultasi/bindings/konsultasi_binding.dart';
import '../modules/konsultasi/views/konsultasi_view.dart';
import '../modules/kontak_darurat/bindings/kontak_darurat_binding.dart';
import '../modules/kontak_darurat/views/kontak_darurat_view.dart';
import '../modules/obat_resep/bindings/obat_resep_binding.dart';
import '../modules/obat_resep/views/obat_resep_view.dart';
import '../modules/posyandu/bindings/posyandu_binding.dart';
import '../modules/posyandu/views/posyandu_view.dart';
import '../modules/profil_pegawai/bindings/profil_pegawai_binding.dart';
import '../modules/profil_pegawai/views/profil_pegawai_view.dart';
import '../modules/rawat_inap/bindings/rawat_inap_binding.dart';
import '../modules/rawat_inap/views/rawat_inap_view.dart';
import '../modules/riwayat_medis/bindings/riwayat_medis_binding.dart';
import '../modules/riwayat_medis/views/riwayat_medis_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.KONSULTASI,
      page: () => const KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.POSYANDU,
      page: () => const PosyanduView(),
      binding: PosyanduBinding(),
    ),
    GetPage(
      name: _Paths.OBAT_RESEP,
      page: () => const ObatResepView(),
      binding: ObatResepBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_MEDIS,
      page: () => const RiwayatMedisView(),
      binding: RiwayatMedisBinding(),
    ),
    GetPage(
      name: _Paths.EDUKASI_KESEHATAN,
      page: () => const EdukasiKesehatanView(),
      binding: EdukasiKesehatanBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK_DARURAT,
      page: () => const KontakDaruratView(),
      binding: KontakDaruratBinding(),
    ),
    GetPage(
      name: _Paths.RAWAT_INAP,
      page: () => const RawatInapView(),
      binding: RawatInapBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_PEGAWAI,
      page: () => const ProfilPegawaiView(),
      binding: ProfilPegawaiBinding(),
    ),
  ];
}
