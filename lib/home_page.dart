import 'package:flutter/material.dart';
import 'package:tugaspraktikum3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namauser; // Menyimpan username yang dimuat

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Memanggil fungsi untuk memuat username saat halaman dibuka
  }

  void _loadUsername() async {
    // Inisialisasi SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Ambil username yang sudah tersimpan
    String? storedUsername = prefs.getString('username');
    // Set username pada UI
    setState(() {
      namauser = storedUsername; // Memperbarui nama pengguna
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.redAccent, // Mengubah warna AppBar
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Hai, ${namauser ?? "Pengguna"}! Ini adalah halaman utama Anda. Di sini Anda dapat menemukan berbagai informasi dan fitur yang berguna.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
