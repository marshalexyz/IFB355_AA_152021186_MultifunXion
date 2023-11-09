import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black, // Mengatur warna latar belakang AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo_x.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black, // Mengatur warna ikon menjadi hitam
                    ),
                    labelStyle: TextStyle(
                        color:
                            Colors.black), // Mengatur warna label menjadi hitam
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Mengatur warna garis bawah menjadi hitam saat inputan aktif
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Mengatur warna garis bawah menjadi hitam saat inputan non-aktif
                    ),
                  ),
                  style: TextStyle(
                      color: Colors
                          .black), // Mengatur warna teks input menjadi hitam
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black, // Mengatur warna ikon menjadi hitam
                    ),
                    labelStyle: TextStyle(
                        color:
                            Colors.black), // Mengatur warna label menjadi hitam
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Mengatur warna garis bawah menjadi hitam saat inputan aktif
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Mengatur warna garis bawah menjadi hitam saat inputan non-aktif
                    ),
                  ),
                  style: TextStyle(
                      color: Colors
                          .black), // Mengatur warna teks input menjadi hitam
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Mendapatkan nilai yang dimasukkan oleh pengguna
                    String enteredUsername = _usernameController.text;
                    String enteredPassword = _passwordController.text;

                    // Memeriksa apakah username dan password sesuai
                    if (enteredUsername == 'user' &&
                        enteredPassword == '1234') {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      // Jika tidak sesuai, tampilkan pesan kesalahan atau lakukan tindakan lain.
                      // Contoh: menampilkan snackbar dengan pesan kesalahan.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Username atau password salah. Coba lagi.'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.white, // Mengatur latar belakang menjadi putih
                    onPrimary:
                        Colors.black, // Mengatur warna font menjadi hitam
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman registrasi
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Belum punya akun? Registrasi di sini',
                    style: TextStyle(
                        color:
                            Colors.black), // Mengatur warna teks menjadi oranye
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
