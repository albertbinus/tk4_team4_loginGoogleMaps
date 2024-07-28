import 'package:get/get.dart';

import '../controllers/survey_form_controller.dart';

class SurveyFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyFormController>(
      () => SurveyFormController(),
    );
  }
}
