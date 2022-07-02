import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class ColoredAnimatedButton extends StatefulWidget {
  final String title;
  final Widget route;
  final Color color;

  const ColoredAnimatedButton({Key? key, required this.route, required this.title, this.color = Colors.orange}): super(key: key);

  @override
  State<ColoredAnimatedButton> createState() => _ColoredAnimatedButtonState();
}

class _ColoredAnimatedButtonState extends State<ColoredAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 2, right: 2),
      child: AnimatedButton(
        color: widget.color,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.route,
              ));
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
