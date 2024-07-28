import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/maps/bindings/maps_binding.dart';
import '../modules/maps/views/maps_view.dart';
import '../modules/surveyDetail/bindings/survey_detail_binding.dart';
import '../modules/surveyDetail/views/survey_detail_view.dart';
import '../modules/surveyForm/bindings/survey_form_binding.dart';
import '../modules/surveyForm/views/survey_form_view.dart';
import '../modules/surveyHome/bindings/survey_home_binding.dart';
import '../modules/surveyHome/views/survey_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => MapsView(),
      binding: MapsBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_HOME,
      page: () => const SurveyHomeView(),
      binding: SurveyHomeBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_FORM,
      page: () => const SurveyFormView(),
      binding: SurveyFormBinding(),
    ),
    GetPage(
      name: _Paths.SURVEY_DETAIL,
      page: () => SurveyDetailView(),
      binding: SurveyDetailBinding(),
    ),
  ];
}
