import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_absensi/app/widget/custom_bottom_navigatio_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    color: Colors.blue[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  -6.200000, 106.816666), // Example coordinates
                              zoom: 15,
                            ),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Lokasi Anda',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Jarak dari Kantor',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '15 Meter',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    color: Colors.blue[100],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '07:15:03',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Masuk', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '17:20:11',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Pulang', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Blue color
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                        ),
                        child: const Icon(Icons.assignment,
                            color: Colors.white, size: 32),
                      ),
                      const SizedBox(height: 8),
                      const Text('Riwayat Absen',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Green color
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                        ),
                        child: const Icon(Icons.assignment_ind,
                            color: Colors.white, size: 32),
                      ),
                      const SizedBox(height: 8),
                      const Text('Izin', style: TextStyle(color: Colors.black)),
                    ],
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
