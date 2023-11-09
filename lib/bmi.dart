import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiCategory = '';
  String selectedGender = 'Laki-laki'; // Default gender

  void calculateBMI() {
    if (weightController.text.isNotEmpty && heightController.text.isNotEmpty) {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) /
          100; // Convert tinggi dari cm ke meter
      double bmi = weight / (height * height);
      setState(() {
        bmiResult = bmi;

        if (selectedGender == 'Laki-laki') {
          if (bmi < 18.5) {
            bmiCategory = 'Kurus';
          } else if (bmi >= 18.5 && bmi < 24.9) {
            bmiCategory = 'Normal';
          } else if (bmi >= 25.0 && bmi < 29.9) {
            bmiCategory = 'Gemuk';
          } else {
            bmiCategory = 'Obesitas';
          }
        } else {
          if (bmi < 17.5) {
            bmiCategory = 'Kurus';
          } else if (bmi >= 17.5 && bmi < 23.9) {
            bmiCategory = 'Normal';
          } else if (bmi >= 24.0 && bmi < 28.9) {
            bmiCategory = 'Gemuk';
          } else {
            bmiCategory = 'Obesitas';
          }
        }
      });
    } else {
      // Beritahu pengguna jika ada input yang kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Input Kosong"),
            content:
                Text("Pastikan Anda mengisi berat badan dan tinggi badan."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.black,
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              items: <String>['Laki-laki', 'Perempuan'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Hitung BMI', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Hasil BMI:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Kategori:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              bmiCategory,
              style: TextStyle(fontSize: 24, color: Colors.blue),
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
