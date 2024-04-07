import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.containerSize = 50,
  }) : super(key: key);

  final Widget icon;
  final Function()? onPressed;
  final double containerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
