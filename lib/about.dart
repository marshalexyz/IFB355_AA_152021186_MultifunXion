import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package url_launcher untuk membuka tautan

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About MultifunXion'),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Aplikasi Multifungsi',
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CircleAvatar(
                radius: 160,
                backgroundImage: AssetImage(
                  'assets/Agif.jpg',
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Nama Developer: Agif Ghifari M',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Email: agif.ghifari@mhs.itenas.com',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Text(
                  'Tentang Aplikasi MultifunXion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Aplikasi Multifungsi ini dirancang untuk membantu Anda dalam berbagai tugas sehari-hari. '
                  'Dengan berbagai fitur yang disediakan, aplikasi ini dapat digunakan untuk kalkulator, konversi suhu, konversi mata uang, hitung bmi.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.instagram.com/cadisdmarshal');
                    },
                    child: Image.asset(
                      'assets/instagram_logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.tiktok.com/yuimuru');
                    },
                    child: Image.asset(
                      'assets/tiktok_logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://twitter.com/txtdarimarshal');
                    },
                    child: Image.asset(
                      'assets/twitter_logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuka tautan
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

  void main() {
    runApp(MaterialApp(
      home: AboutPage(),
    ));
  }
}
