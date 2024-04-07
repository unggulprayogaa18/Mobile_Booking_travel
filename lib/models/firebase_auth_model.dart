import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Sign-in berhasil, Anda dapat menambahkan logika tambahan di sini jika diperlukan.
    } catch (e) {
      // Handle sign-in errors
      print("Sign-in error: $e");
      // Anda dapat menambahkan logika penanganan kesalahan atau menampilkan pesan kesalahan di sini.
    }
  }

  // Tambahkan metode atau fungsi lain sesuai kebutuhan Anda
}
