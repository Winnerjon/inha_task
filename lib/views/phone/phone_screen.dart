import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../common/color/colors.dart';
import '../code/code_screen.dart';
import 'phone_controller.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: '-##-###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GetBuilder<PhoneController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Text(
                  "Enter your phone\nnumber",
                  style: TextStyle(color: AppColor.textColor, fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12,),
                Text(
                  "We're going to send you a verification code to confirm your identity",
                  style: TextStyle(color: AppColor.textColor, fontSize: 16),
                ),
                const SizedBox(height: 24,),
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColor.greenColor, width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        height: 19,
                        width: 35,
                        image: AssetImage("assets/images/uzbek.png"),
                      ),
                      const Icon(Icons.arrow_drop_down),
                      const SizedBox(width: 10,),
                      Text("+998", style: TextStyle(color: AppColor.textColor, fontSize: 16),),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [phoneFormatter],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            controller.onFullPhone(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100,),
                MaterialButton(
                  height: 56,
                  minWidth: double.infinity,
                  color: controller.isFull ? AppColor.buttonColor : AppColor.greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  onPressed: () {
                    if(controller.isFull) {
                      Get.to(const CodeScreen());
                    }
                  },
                  child: const Text("Verify Phone Number", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
