import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/widget/nav/buttom_nav_item_widget.dart';
import 'package:insta/core/widget/nav/nav_model.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentPage;
  final Function(int)? onTap;
  const BottomNavBarWidget({super.key, required this.currentPage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraLarge, horizontal: Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(spreadRadius: 1,blurRadius: 1,  color: context.theme.disabledColor, offset: Offset(0,2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(rootNavItemList.length, (index) {
          return ButtomNavItemWidget(
            isActive: currentPage == index,
            ontap: (){
              onTap?.call(index);
            }, 
            iconPath: currentPage == index? rootNavItemList[index].activeIcon: rootNavItemList[index].inActiveIcon,
          );
        }),
      ),
    );
  }
}
