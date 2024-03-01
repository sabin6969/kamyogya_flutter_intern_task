import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/main.dart';
import 'package:kamyogya_flutter_intern_task/utils/show_snackbar.dart';
import 'package:kamyogya_flutter_intern_task/widgets/custom_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final String apiEndPoint =
      dotenv.env["API_END_POINT"] ?? "Failed to load environment variable";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    apiEndPoint,
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    FlutterClipboard.copy(apiEndPoint).then((value) {
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
            Form(
              key: _globalKey,
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "This field is required" : null,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {}
              },
              minWidth: size.width,
              buttonName: "Done",
            )
          ],
        ),
      ),
    );
  }
}
