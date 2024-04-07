import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';
import 'app_text.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    Key? key,
    required this.ratingScore,
    this.totalReviewer = 0,
    this.showReviews = false,
  }) : super(key: key);

  final double ratingScore;
  final int totalReviewer;
  final bool showReviews;

  @override
  Widget build(BuildContext context) {
    const size = 15.0;
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Container(
            margin: const EdgeInsets.all(1),
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: i <= ratingScore ? ColorName.yellow : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: ColorName.yellow, width: 2),
            ),
          ),
        const SizedBox(width: 12),
        AppText.medium(
          '${ratingScore > 5 ? 5.0 : ratingScore}',
          fontWeight: FontWeight.bold,
        ),
        if (showReviews) ...[
          const SizedBox(width: 12),
          AppText.medium(
            '($totalReviewer ${totalReviewer > 1 ? 'reviews' : 'review'})',
            textDecoration: TextDecoration.underline,
          ),
        ],
      ],
    );
  }
}
