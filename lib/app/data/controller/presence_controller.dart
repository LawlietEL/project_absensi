import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:project_absensi/app/data/API/presence_api.dart';
import 'package:project_absensi/app/data/controller/auth_controller.dart';
import 'package:project_absensi/app/widget/dialog/custom_alert_dialog.dart';
import 'package:project_absensi/app/widget/toast/custom_toast.dart';

class PresenceController extends GetxController {
  RxBool isLoading = false.obs;
  final authC = Get.find<AuthController>();

  presence() async {
    isLoading.value = true;
    Map<String, dynamic> determinePosition = await _determinePosition();
    if (!determinePosition["error"]) {
      Position position = determinePosition["position"];
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String address =
          '${placemarks.first.street}, ${placemarks.first.subLocality}, ${placemarks.first.locality}';
      double distance = Geolocator.distanceBetween(
          double.parse(authC.profilPerusahaanModel.data!.latitude!),
          double.parse(authC.profilPerusahaanModel.data!.longitude!),
          position.latitude,
          position.longitude);

      // Logging the position, address, and distance for debugging purposes
      print(
          position); // Don't invoke 'print' in production code. Try using a logging framework.
      print(
          address); // Don't invoke 'print' in production code. Try using a logging framework.
      print(
          distance); // Don't invoke 'print' in production code. Try using a logging framework.

      // presence (store to database)
      if (distance <= 500) {
        CustomAlertDialog.showPresenceAlert(
            title: "Are you want to check in?",
            message: "You need to confirm before you\ncan do presence now",
            onCancel: () => Get.back(),
            onConfirm: () async {
              await processPresence(position, address, distance);
            });
        isLoading.value = false;
      } else {
        CustomToast.errorToast(
            'Tidak bisa absen', 'lokasi kamu lebih dari 200 meter dari kantor');
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      Get.snackbar("Terjadi kesalahan", determinePosition["message"]);
      // print(determinePosition["error"]);
    }
  }

  Future processPresence(
      Position position, String address, double distance) async {
    try {
      isLoading.value = true;
      var res = await PresenceApi().absenMasuk(
        accesstoken: authC.currentToken!,
        usersId: authC.currentusersId!,
        lokasi: address,
        waktuAbsenMasuk: DateTime.now().toString(),
      );
      isLoading.value = false;
      if (res.data['success'] == true) {
        Get.back();
        CustomToast.successToast("Success", res.data['message'].toString());
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }

  Future<Map<String, dynamic>> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return {
          "message":
              "Tidak dapat mengakses karena anda menolak permintaan lokasi",
          "error": true,
        };
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return {
        "message":
            "Location permissions are permanently denied, we cannot request permissions.",
        "error": true,
      };
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    return {
      "position": position,
      "message": "Berhasil mendapatkan posisi device",
      "error": false,
    };
  }
}
