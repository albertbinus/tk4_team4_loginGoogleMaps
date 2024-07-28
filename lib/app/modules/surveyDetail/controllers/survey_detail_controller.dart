import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SurveyDetailController extends GetxController {
  var name = ''.obs;
  var age = ''.obs;
  var tpsNo = ''.obs;
  var detailJob = ''.obs;

  void fetchDetail(String id) async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection('surveys').doc(id).get();
      if (document.exists) {
        var data = document.data() as Map<String, dynamic>;
        name.value = data['name'] ?? '';
        age.value = data['age'] ?? '';
        tpsNo.value = data['tps_no'] ?? '';
        detailJob.value = data['detail_job'] ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Get Data');
    }
  }
}
