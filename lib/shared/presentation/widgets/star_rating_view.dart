import 'package:flutter/material.dart';

class StarRatingView extends StatelessWidget {
  const StarRatingView({
    super.key,
    required this.totalStar,
    required this.rating,
  });
  final int totalStar;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalStar, (index) {
        IconData icon;
        if (rating >= index + 1) {
          icon = Icons.star;
        } else if (rating > index && rating < index + 1) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: Colors.amber, size: 15);
      }),
    );
  }
}
