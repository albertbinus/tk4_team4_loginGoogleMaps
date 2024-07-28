import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/survey_detail_controller.dart';

class SurveyDetailView extends GetView<SurveyDetailController> {
  SurveyDetailView({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    final String id = Get.arguments; 
    controller.fetchDetail(id);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Survey'),
        centerTitle: true,
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => _buildDetailCard('Name', controller.name.value)),
              const SizedBox(height: 16),
              Obx(() => _buildDetailCard('Age', controller.age.value)),
              const SizedBox(height: 16),
              Obx(() => _buildDetailCard('TPS No', controller.tpsNo.value)),
              const SizedBox(height: 16),
              Obx(() => _buildDetailCard('Detail Job', controller.detailJob.value)),
            ],
          ),
        ),
      ),
    );
  }


    Widget _buildDetailCard(String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF616161),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
