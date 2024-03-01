import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/main.dart';
import 'package:kamyogya_flutter_intern_task/utils/show_snackbar.dart';
import 'package:kamyogya_flutter_intern_task/widgets/custom_button.dart';
import 'package:clipboard/clipboard.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "https://rotarydistrict3292.org.np/api/club/member/search",
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    FlutterClipboard.copy("This is text").then((value) {
                      showSnackBar(
                        message: "API end point copied",
                        context: context,
                      );
                    });
                  },
                  minWidth: size.width * 0.2,
                  buttonName: "Copy",
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFormField(),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomButton(
              onPressed: () {},
              minWidth: size.width,
              buttonName: "Done",
            )
          ],
        ),
      ),
    );
  }
}
