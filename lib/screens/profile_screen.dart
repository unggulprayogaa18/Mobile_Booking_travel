import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_nav_bar.dart';
import 'package:uts_hotel_puputunggulprayoga/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan informasi pengguna saat ini dari FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: CustomNavBar(index: 4),
      body: ListView(
        children: [
          // List 1: Text Profile dan Avatar
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 252, 252, 251),
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : AssetImage('assets/image/yoga.jpeg')
                            as ImageProvider<Object>,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nama: ${user?.displayName ?? "Belum diset"}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Email: ${user?.email ?? "Belum diset"}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20), // Tambahkan jarak di sini
          // List 2: About
          ListTile(
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // subtitle: Text(
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 16,
            //   ),
            // ),
          ),
          SizedBox(height: 20), // Tambahkan jarak di sini
          // List 3: Switch Account
          Material(
            elevation: 30.0,
            shadowColor: Color(0x55434343),
            child: ListTile(
              title: Text(
                'Switch Account',
                style: TextStyle(
                  color: const Color.fromARGB(255, 10, 10, 10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk beralih akun
                },
                child: Text('Switch'),
              ),
            ),
          ),

          SizedBox(height: 20), // Tambahkan jarak di sini
          // List 5: Services
          Material(
            elevation: 30.0,
            shadowColor: Color(0x55434343),
            child: ListTile(
              title: Text(
                'Services',
                style: TextStyle(
                  color: const Color.fromARGB(255, 10, 10, 10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk membuka halaman pengaturan
                },
                child: Text('Services'),
              ),
            ),
          ),
          SizedBox(height: 20), // Tambahkan jarak di sini
          // List 6: Logout
          Material(
            elevation: 30.0,
            shadowColor: Color(0x55434343),
            child: ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  color: const Color.fromARGB(255, 10, 10, 10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () async  {
                // Lakukan logout menggunakan FirebaseAuth
                await FirebaseAuth.instance.signOut();

              // Setelah logout berhasil, berpindah ke halaman admin
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                );
                },

                child: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
