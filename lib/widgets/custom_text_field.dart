import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: AppText.small(label, fontSize: 14),
          border: InputBorder.none,
        ),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
