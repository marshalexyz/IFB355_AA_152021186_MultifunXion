import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
              color: Colors.white), // Mengatur warna font menjadi hitam
        ),
        backgroundColor:
            Colors.black, // Mengatur latar belakang app bar menjadi hitam
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              RegisterForm(), // Memanggil widget form registrasi yang akan dibuat
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/logo_x.png', // Ganti dengan path gambar logo aplikasi Anda
          width: 200, // Atur ukuran sesuai kebutuhan
          height: 200,
        ),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
            icon: Icon(
              Icons.person,
              color: Colors.black, // Mengatur warna ikon menjadi hitam
            ),
            labelStyle: TextStyle(
              color: Colors.black, // Mengatur warna label menjadi hitam
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat aktif menjadi hitam
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat non-aktif menjadi hitam
            ),
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            icon: Icon(
              Icons.email,
              color: Colors.black, // Mengatur warna ikon menjadi hitam
            ),
            labelStyle: TextStyle(
              color: Colors.black, // Mengatur warna label menjadi hitam
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat aktif menjadi hitam
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat non-aktif menjadi hitam
            ),
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.black, // Mengatur warna ikon menjadi hitam
            ),
            labelStyle: TextStyle(
              color: Colors.black, // Mengatur warna label menjadi hitam
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat aktif menjadi hitam
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black), // Mengatur warna garis bawah saat non-aktif menjadi hitam
            ),
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Ambil nilai yang dimasukkan oleh pengguna
            String username = _usernameController.text;
            String email = _emailController.text;
            String password = _passwordController.text;

            // Validasi apakah data pendaftaran sesuai dengan aturan (misalnya, validasi email)
            if (username.isNotEmpty &&
                email.isNotEmpty &&
                password.isNotEmpty) {
              // Simpan data pendaftaran pengguna, misalnya, di dalam daftar pengguna atau kirim ke server

              // Setelah pendaftaran berhasil, arahkan pengguna ke halaman login (bisa juga profile)
              Navigator.pushNamed(context, '/home');
            } else {
              // Tampilkan pesan kesalahan jika ada data yang kurang atau tidak sesuai
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Pendaftaran Gagal'),
                    content: Text('Mohon isi semua informasi dengan benar.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary:
                Colors.white, // Mengatur latar belakang tombol menjadi putih
            onPrimary: Colors.black, // Mengatur warna font menjadi hitam
          ),
          child: Text('Registrasi'),
        ),
      ],
    );
  }
}
