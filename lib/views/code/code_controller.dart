import 'package:get/get.dart';

class CodeController extends GetxController {
  bool isError = false;
  bool isFull = false;

  void onFull(String text) {
    if(text.length == 4) {
      isFull = true;
    }else{
      isFull = false;
      if(text.isEmpty) {
        isError = false;
      }
    }
    update();
  }

  bool onCheck(String text) {
    if(text == "2222") {
      return true;
    }else{
      isError = true;
      update();
      return false;
    }
  }
}