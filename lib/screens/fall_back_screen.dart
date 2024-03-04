import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class FallBackScreen extends StatefulWidget {
  const FallBackScreen({super.key});

  @override
  State<FallBackScreen> createState() => _FallBackScreenState();
}

class _FallBackScreenState extends State<FallBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppAssets.pageNotFoundAnimation,
        ),
      ),
    );
  }
}
