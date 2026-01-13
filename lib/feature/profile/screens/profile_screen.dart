import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/core/util/asset_icons.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/dimensions_widget.dart';
import 'package:insta/core/widget/icon_widget.dart';
import 'package:insta/core/widget/image_widget.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/home/wisgets/story_profile_widget.dart';
import 'package:insta/feature/profile/controller/profile_controller.dart';
import 'package:insta/feature/profile/domain/model/profile_model.dart';
import 'package:insta/feature/profile/widgets/profile_rating_count_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProfileController>().fetchStories();
    Get.find<ProfileController>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (profileControler) {
          return DefaultTabController(
            length: 3,
            child: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      foregroundColor: context.theme.primaryColor,
                      elevation: 0,
                      floating: true,
                      snap: true,
                      centerTitle: true,
                      title: Text(profileControler.profileModel?.name ?? ""),
                      leading: const Icon(Icons.add),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    SliverToBoxAdapter(
                      child: profileSection(
                        profileControler.storyLit,
                        profileModel: profileControler.profileModel
                      ),
                    ),

                    SliverAppBar(
                      floating: true,
                      snap: true,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      bottom: tabBarWidget(context),
                    ),

                    // 🔹 TAB BAR ONLY (NO APPBAR)
                    // SliverPersistentHeader(
                    //   pinned: true,
                    //   floating: true,
                    //   delegate: _TabBarDelegate(tabBarWidget(context)),
                    // ),
                  ];
                },
                body: TabBarView(
                  children: [yourPhotos(), yourPhotos(), yourPhotos()],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

TabBar tabBarWidget(BuildContext context) {
  return TabBar(
    indicatorSize: TabBarIndicatorSize.label,

    tabs: [
      Tab(
        child: IconWidget(
          color: context.theme.primaryColor,
          path: AssetIcons.explore,
        ),
      ),
      Tab(
        child: IconWidget(
          color: context.theme.primaryColor,
          path: AssetIcons.reels,
        ),
      ),
      Tab(
        child: IconWidget(
          color: context.theme.primaryColor,
          path: AssetIcons.profileActive,
        ),
      ),
    ],
  );
}

Widget profileSection(
  List<StoryModel> storyLit, {
  required ProfileModel profileModel
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StoryAvatarWidget(imageUrl: "imageUrl"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileRatingCountWidget(count: profileModel.postCount, label: "Posts"),
                      ProfileRatingCountWidget(
                        count: profileModel.followersCount,
                        label: "Followers",
                      ),
                      ProfileRatingCountWidget(
                        count: profileModel.followingCount,
                        label: "Following",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GapY(value: Dimensions.paddingSizeDefault),

            Text(
              profileModel.name,
              style: interBold.copyWith(fontSize: Dimensions.fontSizeLarge),
            ),
            GapY(value: Dimensions.paddingSizeExtraSmall),
            Text(
              profileModel.bio,
              style: interBold.copyWith(fontSize: Dimensions.fontSizeDefault),
            ),
          ],
        ),
      ),

      StoryProfileWidget(storyList: storyLit, ),
    ],
  );
}

Widget yourPhotos() {
  return GridView.builder(
    itemCount: 20,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.all(2),
        child: ImageWidget(AppConstants.profile),
      );
    },
  );
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
