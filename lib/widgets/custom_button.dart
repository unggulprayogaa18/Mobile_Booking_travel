import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(ColorName.yellow),
        minimumSize: MaterialStateProperty.all(const Size(200, 50)),
        elevation: MaterialStateProperty.all(0),
      ),
      child: AppText.medium(
        buttonText,
        fontSize: 16,
      ),
    );
  }
}
