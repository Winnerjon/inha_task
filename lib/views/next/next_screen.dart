import 'package:flutter/material.dart';

import '../../common/color/colors.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Done",
              style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 19,
            ),
            Text(
              "Thanks for giving as your precious time\nNow you are ready for an enjoyable \nmoment.",
              style: TextStyle(color: AppColor.textColor, fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            const Image(
              height: 282,
              width: double.infinity,
              image: AssetImage("assets/images/saly.png"),
            ),
            const SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MaterialButton(
                height: 56,
                minWidth: double.infinity,
                color: AppColor.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                onPressed: () {},
                child: const Text(
                  "Let's go",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
