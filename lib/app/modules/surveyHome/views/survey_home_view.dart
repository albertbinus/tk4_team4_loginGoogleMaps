import 'package:flutter/material.dart'; 

import 'package:get/get.dart';
import 'package:pemilu/app/routes/app_pages.dart';

import '../controllers/survey_home_controller.dart';

class SurveyHomeView extends GetView<SurveyHomeController> {
  const SurveyHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey Pengawas Pemilu'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.petugasList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.petugasList.length,
          itemBuilder: (context, index) {
            final petugas = controller.petugasList[index];
            return _buildPetugasCard(petugas['id'], petugas['name'], petugas['tps_no']);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.SURVEY_FORM);
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  Widget _buildPetugasCard(String id, String name, String tps) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SURVEY_DETAIL, arguments: id);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const Icon(Icons.person, color: Colors.blue),
          title: Text(name),
          subtitle: Text(tps),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Get.toNamed(Routes.SURVEY_FORM, arguments: id);
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Konfirmasi',
                    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    middleText: 'Yakin Menghapus Data ?',
                    middleTextStyle: const TextStyle(fontSize: 16),
                    confirm: ElevatedButton(
                      onPressed: () {
                        controller.deleteSurveyData(id);
                        Get.back();
                      },
                      child: const Text('Ya, Hapus', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Batal', style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                    ),
                    barrierDismissible: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
