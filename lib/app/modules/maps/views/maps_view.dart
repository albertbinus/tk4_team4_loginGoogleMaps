import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:pemilu/app/routes/app_pages.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  MapsView({Key? key}) : super(key: key);

  final MapsController controller = Get.put(MapsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Current Location'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.signOut(context); // Panggil fungsi logout
            },
          ),
        ],
      ),
      body: GetBuilder<MapsController>(
        builder: (controller) {
          if (controller.currentLocation == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation!,
              zoom: 20,
            ),
            markers: {
              Marker(
                markerId: MarkerId('currentLocation'),
                position: controller.currentLocation!,
              ),
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        width: 150, // Atur lebar tombol agar teks bisa muncul
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.SURVEY_HOME);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Isi Survey',
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward),
            ],
          ),
          // backgroundColor: , // Warna tombol
        ),
      ),
    );
  }
}
