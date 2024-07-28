import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemilu/app/routes/app_pages.dart';

class SurveyFormController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController tpsNoC = TextEditingController();
  TextEditingController detailJobC = TextEditingController();
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<void> saveSurveyData() async {
    try {
      await _firestore.collection('surveys').add({
        'name': nameC.text,
        'age': ageC.text,
        'tps_no': tpsNoC.text,
        'detail_job': detailJobC.text,
        'created_at': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', 'Data saved successfully');
      Get.offAllNamed(Routes.SURVEY_HOME);  
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e');
    }
  }

  Future<void> fetchSurveyData(String id) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('surveys').doc(id).get();
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        nameC.text = data['name'];
        ageC.text = data['age'];
        tpsNoC.text = data['tps_no'];
        detailJobC.text = data['detail_job'];
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }

  Future<void> updateSurveyData(String id) async {
    try {
      await _firestore.collection('surveys').doc(id).update({
        'name': nameC.text,
        'age': ageC.text,
        'tps_no': tpsNoC.text,
        'detail_job': detailJobC.text,
      });
      Get.snackbar('Success', 'Data updated successfully');
      Get.offAllNamed(Routes.SURVEY_HOME);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update data: $e');
    }
  }
}
