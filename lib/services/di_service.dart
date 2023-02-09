import 'package:get/get.dart';

import '../views/code/code_controller.dart';
import '../views/phone/phone_controller.dart';


class DIService {
  static Future<void> init() async {
    Get.lazyPut<PhoneController>(() => PhoneController(), fenix: true);
    Get.lazyPut<CodeController>(() => CodeController(), fenix: true);
  }
}