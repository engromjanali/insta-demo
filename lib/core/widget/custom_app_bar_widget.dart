import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/main.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? additionalTitle;
  final Widget? subTitle;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final BuildContext? context;
  final Widget? actionView;
  final bool centerTitle;
  final bool isTransparent;
  final double elevation;
  final Widget? leading;
  final Color? titleColor;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.context,
    this.actionView,
    this.centerTitle = true,
    this.isTransparent = false,
    this.elevation = 0,
    this.leading,
    this.titleColor, this.additionalTitle, this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: additionalTitle !=null ? Row(children: [
        Text(
          title!,
          style: interBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            color: titleColor ?? (isTransparent ? Theme.of(context).cardColor : Theme.of(context).textTheme.bodyLarge!.color),
          ),
        ),
        Text(
          additionalTitle!,
          style: interBold.copyWith(
            fontSize: Dimensions.fontSizeSmall,
            color: titleColor ?? (isTransparent ? Theme.of(context).cardColor : Theme.of(context).textTheme.bodyLarge!.color?.withValues(alpha: 0.5)),
          ),
        )
      ]) : Column(
        crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: interBold.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: titleColor ?? (isTransparent ? Theme.of(context).cardColor : Theme.of(context).textTheme.bodyLarge!.color),
            ),
          ),

          subTitle ?? const SizedBox(),
        ],
      ),
      titleSpacing: additionalTitle !=null ? 0 : null,
      centerTitle: centerTitle,
      leading: isBackButtonExist ? IconButton(
        icon: leading ?? const Icon(Icons.arrow_back_ios),
        color: titleColor ?? (isTransparent ? Theme.of(context).cardColor : Theme.of(context).primaryColor),
        onPressed: () => onBackPressed != null ? onBackPressed!() : (){Get.back();},
      ) : const SizedBox(),
      actions: actionView != null ? [Padding(
        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
        child: actionView!,
      )] : [],
      backgroundColor: isTransparent ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
