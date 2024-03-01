import 'package:flutter/material.dart';

class FallBackScreen extends StatefulWidget {
  const FallBackScreen({super.key});

  @override
  State<FallBackScreen> createState() => _FallBackScreenState();
}

class _FallBackScreenState extends State<FallBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is fall back page"),
      ),
    );
  }
}
