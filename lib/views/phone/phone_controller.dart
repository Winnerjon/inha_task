import 'package:get/get.dart';

class PhoneController extends GetxController {
  bool isFull = false;

  void onFullPhone(String text) {
    if(text.length == 13) {
      isFull = true;
    }else{
      isFull = false;
    }
    update();
  }
}