import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';
import 'app_text.dart';

class MapMarkerPrice extends StatelessWidget {
  const MapMarkerPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_drop_down,
              color: Color.fromARGB(255, 221, 28, 28),
              size: 50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 28),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 85, 27),
                borderRadius: BorderRadius.circular(8)),
            child: AppText.medium(
              price,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
