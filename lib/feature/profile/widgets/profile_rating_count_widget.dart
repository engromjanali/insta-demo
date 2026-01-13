
import 'package:flutter/material.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/dimensions_widget.dart';

class ProfileRatingCountWidget extends StatelessWidget {
  final int count;
  final String label;
  const ProfileRatingCountWidget({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: interBold.copyWith(fontSize: Dimensions.radiusExtraLarge),
        ),
        GapY(value: Dimensions.paddingSizeExtraSmall),
        Text(
          label,
          style: interBold.copyWith(fontSize: Dimensions.fontSizeDefault),
        ),
      ],
    );
  }
}
