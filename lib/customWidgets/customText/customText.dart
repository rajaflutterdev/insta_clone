import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customText extends StatefulWidget {
  String textName;
  TextStyle? textStyle;
  Color? fontColor;
  int? maxLine;
  TextOverflow? overflow;

  customText({
    super.key,
    required this.textName,
    this.textStyle,
    this.fontColor,
    this.overflow,
    this.maxLine,
  });

  @override
  State<customText> createState() => _customTextState();
}

class _customTextState extends State<customText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: widget.overflow??TextOverflow.visible,
      maxLines: widget.maxLine??1000000,
      widget.textName ?? "",
      style: widget.textStyle ??
          GoogleFonts.aboreto(
            color: widget.fontColor ?? Colors.black,
          ),
    );
  }
}
