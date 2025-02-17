import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  final Widget child;
  final Gradient gradient;
   const GradientText(
       {
        required this.gradient,
        required this.child,
      });

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => widget.gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: widget.child,
    );
  }
}