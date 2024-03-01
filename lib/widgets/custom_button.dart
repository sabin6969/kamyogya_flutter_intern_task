import 'package:flutter/material.dart';
import 'package:kamyogya_flutter_intern_task/main.dart';

class CustomButton extends StatefulWidget {
  final void Function()? onPressed;
  final double minWidth;
  final String buttonName;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.minWidth,
    required this.buttonName,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MaterialButton(
      elevation: 0,
      shape: const StadiumBorder(),
      color: Theme.of(context).primaryColor,
      onPressed: widget.onPressed,
      height: size.height * 0.065,
      minWidth: widget.minWidth,
      child: Text(
        widget.buttonName,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
