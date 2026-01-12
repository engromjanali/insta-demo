import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta/core/util/asset_icons.dart';
import 'package:insta/core/widget/custom_app_bar_widget.dart';
import 'package:insta/core/widget/dimensions_widget.dart';
import 'package:insta/core/widget/icon_widget.dart';
import 'package:insta/feature/home/controller/home_controller.dart';
import 'package:insta/feature/home/wisgets/post_widget.dart';
import 'package:insta/feature/home/wisgets/story_profile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().fetchStories();
    Get.find<HomeController>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Instagram",
        leading: IconWidget(path: AssetIcons.camera),
        actionView: Row(
          children: [
            IconWidget(path: AssetIcons.notification),
            GapX(value: 20),
            IconWidget(path: AssetIcons.share),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (homeControler) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Divider(),
                    StoryProfileWidget(storyList: homeControler.storyLit,),
                    Divider(),
                  ],
                ),
              ),

              PostWidget(list: homeControler.posts,),
            ],
          );
        },
      ),
    );
  }
}
