import 'package:get/get.dart';

import '../controllers/survey_home_controller.dart';

class SurveyHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyHomeController>(
      () => SurveyHomeController(),
    );
  }
}
