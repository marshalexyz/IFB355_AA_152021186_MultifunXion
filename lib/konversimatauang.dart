import 'package:flutter/material.dart';
// Import file dashboard.dart
// Import file login.dart
// Import file kalkulator.dart
// Import file about.dart
// Import file bmi.dart
// Import file currency.dart

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double amount = 0.0;
  String fromCurrency = 'USD';
  String toCurrency = 'USD'; // Mata uang tujuan default
  double convertedAmount = 0.0;

  // Daftar faktor konversi mata uang
  final Map<String, Map<String, double>>? currencyConversionRates = {
    'USD': {
      'USD': 1.0,
      'EUR': 0.85,
      'GBP': 0.73,
      'JPY': 110.33,
      'IDR': 14000.0
    },
    'EUR': {
      'USD': 1.18,
      'EUR': 1.0,
      'GBP': 0.87,
      'JPY': 130.62,
      'IDR': 16548.0
    },
    'GBP': {
      'USD': 1.37,
      'EUR': 1.15,
      'GBP': 1.0,
      'JPY': 150.37,
      'IDR': 19059.0
    },
    'JPY': {
      'USD': 0.0091,
      'EUR': 0.0077,
      'GBP': 0.0067,
      'JPY': 1.0,
      'IDR': 127.07
    },
    'IDR': {
      'USD': 0.0000714,
      'EUR': 0.0000604,
      'GBP': 0.0000524,
      'JPY': 0.0079,
      'IDR': 1.0
    },
  };

  // Fungsi untuk mengonversi mata uang
  void convertCurrency() {
    final Map<String, double>? fromCurrencyMap =
        currencyConversionRates?[fromCurrency];
    if (fromCurrencyMap != null) {
      final double? conversionRate = fromCurrencyMap[toCurrency];
      if (conversionRate != null) {
        convertedAmount = amount * conversionRate;
        setState(() {});
      } else {
        // Handle error jika mata uang tujuan tidak ditemukan
        // Misalnya, tampilkan pesan kesalahan atau nilai default
      }
    } else {
      // Handle error jika mata uang asal tidak ditemukan
      // Misalnya, tampilkan pesan kesalahan atau nilai default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
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
            Text(
              'Enter amount:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amount = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Convert from:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (value) {
                setState(() {
                  fromCurrency = value!;
                });
              },
              items: currencyConversionRates?.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList() ??
                  [],
            ),
            SizedBox(height: 20.0),
            Text(
              'Convert to:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (value) {
                setState(() {
                  toCurrency = value!;
                });
              },
              items: currencyConversionRates?.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList() ??
                  [],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Konversikan', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Converted amount: $convertedAmount $toCurrency',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
