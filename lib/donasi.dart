import 'package:flutter/material.dart';

class DonasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi'),
        backgroundColor: Colors.black, // Mengatur warna latar belakang AppBar
      ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Donasi kepada Developer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Terima kasih telah menggunakan aplikasi kami!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qris');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text(
                'Donasi sekarang',
                style: TextStyle(
                    color: Colors
                        .white), // Mengatur warna teks tombol menjadi putih
              ),
            )
          ],
        ),
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
