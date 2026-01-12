import 'package:flutter/material.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/core/widget/nav/buttom_nav_bar.dart';
import 'package:insta/core/widget/nav/nav_model.dart';

class RootScreen extends StatefulWidget {
  final int? initialpage;
  const RootScreen({super.key, this.initialpage});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController pageController;
  late ValueNotifier<int> currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage : widget.initialpage??0);
    currentPage.value = widget.initialpage??0;
  }
  
  @override
  void dispose() {
    pageController.dispose();
    currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (context,pageIndex,_) {
          return BottomNavBarWidget(
            currentPage: pageIndex,onTap: (page){
              currentPage.value = page;
              pageController.animateToPage(page, duration: AppConstants.defaultAnimationDuration, curve: Curves.linear);
            },
          );
        }
      ),
      body: PageView.builder(
        itemCount: rootNavItemList.length,
        onPageChanged: (index){
          if(index>4 || index>0){
            return;
          }
          currentPage.value = index;
        },
        controller: pageController,
        itemBuilder: (context, index) => rootNavItemList[index].child,
      ),
    );
  }
}
