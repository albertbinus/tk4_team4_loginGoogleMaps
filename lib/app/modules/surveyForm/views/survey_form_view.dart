import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/survey_form_controller.dart';

class SurveyFormView extends GetView<SurveyFormController> {
  const SurveyFormView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String? id = Get.arguments;

    // Jika ID tidak null, ambil data dari Firestore
    if (id != null) {
      controller.fetchSurveyData(id);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey Pengawas Pemilu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              decoration: const InputDecoration(
                labelText: 'NAME',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.ageC,
              decoration: const InputDecoration(
                labelText: 'AGE',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.tpsNoC,
              decoration: const InputDecoration(
                labelText: 'TPS NO',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.detailJobC,
              decoration: const InputDecoration(
                labelText: 'DETAIL JOB',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (id != null) {
                      controller.updateSurveyData(id); // Update data jika ID ada
                    } else {
                      controller.saveSurveyData(); // Simpan data baru
                    }
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
