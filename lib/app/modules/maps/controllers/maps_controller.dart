import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pemilu/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MapsController extends GetxController {
 LatLng? currentLocation;

 final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

   Future<void> _getCurrentLocation() async {
    // Meminta izin lokasi
    var status = await Permission.location.request();
    if (status.isGranted) {
      Location location = Location();
      try {
        LocationData locationData = await location.getLocation();
        currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
        update(); // Memperbarui tampilan
      } catch (e) {
        print('Gagal mengambil lokasi: $e');
      }
    } else {
      print('Izin lokasi ditolak');
    }
  }

    Future<void> signOut(BuildContext context) async {
    // Tampilkan dialog konfirmasi
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) { // Ganti nama parameter untuk menghindari konflik
        return AlertDialog(
          // title: const Text('Apakah Anda yakin ingin keluar?'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false), // Tidak keluar
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true), // Keluar
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );

    // Jika pengguna memilih untuk keluar
    if (shouldSignOut == true) {
      await _googleSignIn.signOut();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
