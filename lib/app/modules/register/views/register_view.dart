import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_absensi/app/routes/app_pages.dart';
import 'package:project_absensi/app/style/app_color.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 30 / 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Absensi Karyawan",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: 'poppins',
                    height: 150 / 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Silahkan Buat Akun Anda",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registrasi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'youremail@gmail.com',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: '***********',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika register di sini
                        //Get.find<RegisterController>().register();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: AppColor.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Registrasi',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColor.secondarySoft,
                      ),
                      child: const Text("Kembali ke halaman Login"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
