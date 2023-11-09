import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';
  String result = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      input = '';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
      result = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(input);
      operand = buttonText;
      input = '';
    } else if (buttonText == '=') {
      num2 = double.parse(input);
      if (operand == '+') {
        result = (num1 + num2).toString();
      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == '*') {
        result = (num1 * num2).toString();
      }
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
    } else {
      input += buttonText;
    }

    setState(() {
      input = input;
      result = result;
    });
  }

  Widget buildButton(String buttonText) {
    Color buttonColor;
    if (buttonText == 'C') {
      buttonColor = Colors.red;
    } else {
      buttonColor = Color(0xFF333333);
    }
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator',
          style: TextStyle(
            fontFamily: 'Helvetica', // Mengatur font menjadi Helvetica
            fontSize: 24, // Ukuran teks
            color: Colors.white, // Warna teks
          ),
        ),
        backgroundColor: Colors.black, // Warna latar belakang AppBar
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
              'Mengkonversikan suhu',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomRight,
            child: Text(
              input,
              style: TextStyle(fontSize: 48.0, fontFamily: 'Helvetica'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomRight,
            child: Text(
              result,
              style: TextStyle(
                fontSize: 48.0,
                fontFamily: 'Helvetica',
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('0'),
              buildButton('C'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
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
