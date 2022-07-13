import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class ColoredAnimatedButtonWithAction extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const ColoredAnimatedButtonWithAction({Key? key, required this.title, this.color = Colors.orange, this.width =200, this.height = 64, required this.onPressed}): super(key: key);

  @override
  State<ColoredAnimatedButtonWithAction> createState() => _ColoredAnimatedButtonWithActionState();
}

class _ColoredAnimatedButtonWithActionState extends State<ColoredAnimatedButtonWithAction> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 2, right: 2),
      child: AnimatedButton(
        width: widget.width,
        height: widget.height,
        color: widget.color,
        onPressed: () {
          widget.onPressed;
        },
        child: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'PatrickHand',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
