import 'package:flutter/material.dart';

class SuhuConverterPage extends StatefulWidget {
  @override
  _SuhuConverterPageState createState() => _SuhuConverterPageState();
}

class _SuhuConverterPageState extends State<SuhuConverterPage> {
  double inputSuhu = 0.0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  double convertedSuhu = 0.0;

  // Fungsi untuk mengkonversi suhu
  void convertSuhu() {
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      convertedSuhu = (inputSuhu * 9 / 5) + 32;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      convertedSuhu = (inputSuhu - 32) * 5 / 9;
    } else if (fromUnit == 'Celsius' && toUnit == 'Kelvin') {
      convertedSuhu = inputSuhu + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Celsius') {
      convertedSuhu = inputSuhu - 273.15;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Kelvin') {
      convertedSuhu = (inputSuhu - 32) * 5 / 9 + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Fahrenheit') {
      convertedSuhu = (inputSuhu - 273.15) * 9 / 5 + 32;
    } else {
      // Konversi unit yang sama
      convertedSuhu = inputSuhu;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suhu Converter'),
        backgroundColor:
            Colors.black, // Mengatur warna latar belakang AppBar menjadi hitam
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
                // Tambahkan logika untuk membuka halaman "About"
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Masukkan suhu:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputSuhu = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Konversi dari:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: fromUnit,
              onChanged: (value) {
                setState(() {
                  fromUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Konversi ke:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: toUnit,
              onChanged: (value) {
                setState(() {
                  toUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                convertSuhu();
              },
              child: Text('Hitung Suhu', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Hasil Konversi: ${convertedSuhu.toStringAsFixed(2)} $toUnit',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
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
      onTap: () => _showLogoutConfirmation(
          context), // Menampilkan popup konfirmasi logout
    );
  }
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
