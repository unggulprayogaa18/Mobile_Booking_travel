import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleSignInModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Menambahkan metode signOut
  Future<void> signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Memastikan keluar dari akun Google sebelum login
      await signOut();

      // Minta pengguna untuk memilih akun Gmail
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // Jika pengguna membatalkan pilihan akun, return null
      if (googleSignInAccount == null) {
        return null; // Batal login dengan Google
      }

      // Dapatkan informasi otentikasi
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await _auth.signInWithCredential(googleAuthCredential);
    } catch (error) {
      print("Error during Google sign in: $error");
      return null;
    }
  }
}

final firebaseAuthModelProvider = Provider<GoogleSignInModel>((ref) {
  return GoogleSignInModel();
});
