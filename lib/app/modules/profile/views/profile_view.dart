import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_absensi/app/routes/app_pages.dart';
import '../../../widget/custom_bottom_navigatio_bar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  get authC => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Sign Out',
                content: const Text('Sign out your account? '),
                cancel: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Cancel'),
                ),
                confirm: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                  child: const Text(
                    'Sign Out',
                  ),
                ),
              );
            },
            child: const Row(
              children: [
                Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.logout_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.example.com/path_to_profile_picture.jpg', // Ganti dengan URL gambar profil user
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama User', // Ganti dengan nama user
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'user@example.com', // Ganti dengan email user
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
