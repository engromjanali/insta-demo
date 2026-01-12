import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/widget/icon_widget.dart';

class ButtomNavItemWidget extends StatelessWidget {
  final Function() ontap;
  final bool isActive;
  final String iconPath;
  const ButtomNavItemWidget({super.key, required this.ontap, required this.isActive, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          // color: isActive
          //     ? Theme.of(context).colorScheme.primary
          //     : Theme.of(context).unselectedWidgetColor,
        ),
        child: IconWidget(path: iconPath, color: context.theme.primaryColor ,),
      ),
    );
  }
}
