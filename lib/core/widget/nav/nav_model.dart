import 'package:flutter/material.dart';
import 'package:insta/core/util/asset_icons.dart';
import 'package:insta/feature/explore/explore_screen.dart';
import 'package:insta/feature/home/screens/home_screen.dart';
import 'package:insta/feature/post/post_screen.dart';
import 'package:insta/feature/profile/profile_screen.dart';
import 'package:insta/feature/reels/reels_screen.dart';

class NavItemModel {
  final int index;
  final String activeIcon;
  final String inActiveIcon;
  final String? label;
  final Widget child;
  const NavItemModel({
    this.label,
    required this.index,
    required this.child,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

final List<NavItemModel> rootNavItemList = [
  NavItemModel(
    index: 0,
    label: "Home",
    inActiveIcon: AssetIcons.home,
    child: const HomeScreen(),
    activeIcon: AssetIcons.homeActive,
  ),

  NavItemModel(
    index: 1,
    label: "Explore",
    inActiveIcon: AssetIcons.explore,
    child: ExploreScreen(),
    activeIcon: AssetIcons.exploreActive,
  ),

  NavItemModel(
    index: 2,
    label: "Post",
    inActiveIcon: AssetIcons.post,
    child: PostScreen(),
    activeIcon: AssetIcons.post,
  ),

  NavItemModel(
    index: 3,
    label: "Reels",
    inActiveIcon: AssetIcons.reels,
    child: ReelsScreen(),
    activeIcon: AssetIcons.reelsActive,
  ),

  NavItemModel(
    index: 4,
    label: "Profile",
    inActiveIcon: AssetIcons.profile,
    child: ProfileScreen(),
    activeIcon: AssetIcons.profileActive,
  ),
];
