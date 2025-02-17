import 'package:flutter/material.dart';

class customButton extends StatefulWidget {
  double? buttonHeight;
  double? buttonWidth;
  VoidCallback onPressed;
  Widget child;
  Color? buttonColor;
  double? buttonElevation;
  Color?shadowColor;
  BorderRadius? buttonRadius;

  customButton({
    this.buttonHeight,
    this.buttonRadius,
    this.buttonWidth,
    this.shadowColor,
    this.buttonElevation,
    this.buttonColor,
    required this.onPressed,
    required this.child,
  });

  @override
  State<customButton> createState() => _customButtonState();
}

class _customButtonState extends State<customButton> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onPressed,
      borderRadius: widget.buttonRadius??BorderRadius.circular(5),
      child: Material(
        borderRadius: widget.buttonRadius??BorderRadius.circular(5),
        shadowColor: widget.shadowColor??Colors.black12,
        elevation: widget.buttonElevation??5,
        color: widget.buttonColor?? Colors.white,
        child: SizedBox(
          height: widget.buttonHeight ?? 60,
          width: widget.buttonWidth ?? 60,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
