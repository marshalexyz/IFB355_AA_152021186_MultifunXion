import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_profile/bmi.dart';
import 'package:flutter_auth_profile/kalkulator.dart'; // Impor file calculator.dart
import 'package:flutter_auth_profile/konversimatauang.dart'; // Impor file currency_converter.dart
import 'package:flutter_auth_profile/konversisuhu.dart'; // Impor file suhu.dart

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black, // Ganti warna latar belakang AppBar
      ),
      backgroundColor: Color.fromARGB(255, 33, 32, 32),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'MultifunXion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            buildMenuItem(
              context,
              'Home',
              'Dashboard',
              Icons.home,
              () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            buildMenuItem(
              context,
              'Kalkulator',
              'Aplikasi Kalkulator Sederhana',
              Icons.calculate,
              () {
                Navigator.pushNamed(context, '/calculator');
              },
            ),
            buildMenuItem(
              context,
              'Konversi Mata Uang',
              'Konversi Mata Uang Online',
              Icons.monetization_on,
              () {
                Navigator.pushNamed(context, '/convert');
              },
            ),
            buildMenuItem(
              context,
              'BMI Calculator',
              'Hitung Indeks Massa Tubuh',
              Icons.accessibility,
              () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
            buildMenuItem(
              context,
              'Konversi Suhu',
              'Mengkonversikan Suhu',
              Icons.wb_sunny,
              () {
                Navigator.pushNamed(context, '/suhu');
              },
            ),
            Divider(),
            buildMenuItem(
              context,
              'About',
              'Tentang Aplikasi',
              Icons.info,
              () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            buildMenuItem(
              context,
              'Feedback',
              'Donasi untuk developer',
              Icons.info,
              () {
                Navigator.pushNamed(context, '/donasi');
              },
            ),
            buildLogoutMenuItem(
              context,
              'Logout',
              'Keluar dari Akun',
              Icons.exit_to_app,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMICalculatorScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(208, 233, 225, 225),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessibility, size: 75),
                            Text(
                              'BMI Calculator',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Kalkulator di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Calculator(), // Ganti dengan halaman Kalkulator
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(208, 233, 225, 225),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calculate, size: 75),
                            Text(
                              'Calculator',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Currency Converter di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CurrencyConverterPage(), // Ganti dengan halaman Currency Converter
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(208, 233, 225, 225),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.monetization_on, size: 75),
                            Text(
                              'Currency Converter',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Suhu di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SuhuConverterPage(), // Ganti dengan halaman Suhu
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(208, 233, 225, 225),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny, size: 75),
                            Text(
                              'Suhu',
                              style: TextStyle(fontFamily: 'Poppins Bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem(BuildContext context, String title, String subtitle,
    IconData icon, Function onPressed) {
  return ListTile(
    leading: Icon(
      icon,
      size: 24,
      color: Colors.black,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(color: Colors.black),
    ),
    onTap: () => onPressed(),
  );
}

Widget buildLogoutMenuItem(
    BuildContext context, String title, String subtitle, IconData icon) {
  return ListTile(
    leading: Icon(
      icon,
      size: 24,
      color: Colors.black,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(color: Colors.black),
    ),
    onTap: () =>
        _showLogoutConfirmation(context), // Menampilkan popup konfirmasi logout
  );
}

// Fungsi untuk menampilkan popup konfirmasi logout
void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Konfirmasi Logout',
            style:
                TextStyle(color: Colors.red)), // Ubah warna teks menjadi oranye
        content: Text('Apakah Anda ingin logout?',
            style: TextStyle(
                color: Colors.black)), // Ubah warna teks menjadi oranye
        actions: <Widget>[
          TextButton(
            child: Text('Tidak',
                style: TextStyle(
                    color: Colors.black)), // Ubah warna teks menjadi oranye
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Ya',
                style: TextStyle(
                    color: Colors.red)), // Ubah warna teks menjadi oranye
            onPressed: () {
              // Tambahkan logika logout di sini
              Navigator.of(context).pop();
              // Navigasi ke halaman login_page
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      );
    },
  );
}
