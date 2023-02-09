import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/color/colors.dart';
import '../next/next_screen.dart';
import 'code_controller.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_backspace,
              color: AppColor.textColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GetBuilder<CodeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 84,
                ),
                Text(
                  "Create your pin code",
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Create a 4-digit PIN code that will be used every time you login",
                  style: TextStyle(color: AppColor.textColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 65,
                  child: PinCodeTextField(
                    controller: code,
                    length: 4,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.white),
                    obscureText: true,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    obscuringWidget: const Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 20,
                    ),
                    pinTheme: PinTheme(
                      fieldOuterPadding: EdgeInsets.zero,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(16),
                      fieldHeight: 56,
                      fieldWidth: 56,
                      borderWidth: 1,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColor.greenColor,
                      selectedFillColor: AppColor.greenColor,
                      selectedColor: AppColor.greenColor,
                      activeColor: controller.isError
                          ? Colors.red
                          : AppColor.greenColor,
                      activeFillColor: Colors.white,
                      errorBorderColor: Colors.red,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onChanged: (value) {
                      controller.onFull(value);
                    },
                    appContext: context,
                  ),
                ),
                controller.isError
                    ? Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Wrong",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ))
                    : const SizedBox(),
                const SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  height: 56,
                  minWidth: double.infinity,
                  color: controller.isFull
                      ? AppColor.buttonColor
                      : AppColor.greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  onPressed: () {
                    bool check = controller.onCheck(code.text);
                    if (check) {
                      Get.to(const NextScreen());
                    }
                  },
                  child: const Text(
                    "Verify Phone Number",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
