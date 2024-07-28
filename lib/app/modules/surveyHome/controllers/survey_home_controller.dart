import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SurveyHomeController extends GetxController {
  var petugasList = <Map<String, dynamic>>[].obs; // Observable list untuk menyimpan data petugas
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchPetugas(); // Memanggil method untuk mengambil data saat controller diinisialisasi
  }

  // Method untuk mengambil data dari Firestore
  Future<void> fetchPetugas() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('surveys').get();
      petugasList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Menambahkan ID dokumen ke data
        return data;
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }
  Future<void> deleteSurveyData(String id) async {
    try {
      await _firestore.collection('surveys').doc(id).delete();
      Get.snackbar('Success', 'Data deleted successfully');
      fetchPetugas();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete data: $e');
    }
  }
}
