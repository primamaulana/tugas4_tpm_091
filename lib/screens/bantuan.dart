import 'package:favorite_meals/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Method used to delete the [isAuth] key from the shared prefs.
  Future<bool> _deleteAuthKey() async {
    final prefs = await SharedPreferences.getInstance();

    // The key-value is deleted using the remove method.
    final isKeyDeleted = prefs.remove('isAuth');

    // The result of the delete operation is returned.
    return isKeyDeleted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your paragraph here
              Text(
                "Cara Penggunaan Aplikasi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. Menu Bilangan Prima : Untuk menentukan range pencarian bilangan prima, Start diisi dengan angka mulai dan End diisi dengan angka akhir.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "2. Menu Segitiga : Untuk melakukan pencarian Luas dan Keliling Segitiga, isi masing - masing kolom dengan angka. Kolom Alas dan Tinggi untuk menghitung luas, Kolom Sisi untuk menghitung Keliling.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "3. Menu Daftar Situs : Berisi kumpulan situs 10 Keajaiban di Dunia, terdapat tombol Favorite berupa bintang dan Link menuju situs.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "4. Menu Favorite : Berisi kumpulan situs yang sudah ditambahkan ke dalam situs Favorite.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "5. Menu Stopwatch : Berfungsi sebagai stopwatch yang dapat anda gunakan dimana saja dan kapan saja.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),// Optional spacing between paragraph and button
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final isDeleted = await _deleteAuthKey();
                        if (isDeleted && context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('Logout'),
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
}