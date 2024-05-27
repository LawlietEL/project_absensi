import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/custom_bottom_navigatio_bar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      extendBody: true,
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
