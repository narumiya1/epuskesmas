import 'package:epuskesmas/app/modules/edukasi_kesehatan/bindings/edukasi_kesehatan_binding.dart';
import 'package:epuskesmas/app/modules/edukasi_kesehatan/views/edukasi_kesehatan_view.dart';
import 'package:epuskesmas/app/modules/home/bindings/home_binding.dart';
import 'package:epuskesmas/app/modules/home/views/home_view.dart';
import 'package:epuskesmas/app/modules/konsultasi/bindings/konsultasi_binding.dart';
import 'package:epuskesmas/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:epuskesmas/app/modules/kontak_darurat/bindings/kontak_darurat_binding.dart';
import 'package:epuskesmas/app/modules/kontak_darurat/views/kontak_darurat_view.dart';
import 'package:epuskesmas/app/modules/obat_resep/bindings/obat_resep_binding.dart';
import 'package:epuskesmas/app/modules/obat_resep/views/obat_resep_view.dart';
import 'package:epuskesmas/app/modules/posyandu/bindings/posyandu_binding.dart';
import 'package:epuskesmas/app/modules/posyandu/views/posyandu_view.dart';
import 'package:epuskesmas/app/modules/profil_pegawai/bindings/profil_pegawai_binding.dart';
import 'package:epuskesmas/app/modules/profil_pegawai/views/profil_pegawai_view.dart';
import 'package:epuskesmas/app/modules/rawat_inap/bindings/rawat_inap_binding.dart';
import 'package:epuskesmas/app/modules/rawat_inap/views/rawat_inap_view.dart';
import 'package:epuskesmas/app/modules/riwayat_medis/bindings/riwayat_medis_binding.dart';
import 'package:epuskesmas/app/modules/riwayat_medis/views/riwayat_medis_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan Flutter diinisialisasi
  await initializeDateFormatting('id', null);
  // runApp(const MyApp());

  runApp(
    GetMaterialApp(
      title: "Puskesmas App",
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/konsultasi',
          page: () => const KonsultasiView(),
          binding: KonsultasiBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/posyandu',
          page: () => const PosyanduView(),
          binding: PosyanduBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/obat-resep',
          page: () => const ObatResepView(),
          binding: ObatResepBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/riwayat-medis',
          page: () => const RiwayatMedisView(),
          binding: RiwayatMedisBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/edukasi-kesehatan',
          page: () => const EdukasiKesehatanView(),
          binding: EdukasiKesehatanBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/kontak-darurat',
          page: () => const KontakDaruratView(),
          binding: KontakDaruratBinding(), // Pastikan HomeBinding dibuat
        ),
        GetPage(
          name: '/rawat-inap',
          page: () => const RawatInapView(),
          binding: RawatInapBinding(), // Pastikan RawatInapBinding dibuat
        ),
        GetPage(
          name: '/profil-pegawai',
          page: () => const ProfilPegawaiView(),
          binding: ProfilPegawaiBinding(), // Buat binding jika diperlukan
        ),
        // Daftarkan rute lain di sini (/konsultasi, /obat, dll.)
      ],
      theme: ThemeData(
        fontFamily: 'Roboto', // Ganti dengan font pilihan Anda
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
