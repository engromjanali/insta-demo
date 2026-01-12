import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/core/model/image_payload_model.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/dimensions_widget.dart';
import 'package:insta/core/widget/image_widget.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';

class StoryProfileWidget extends StatelessWidget {
  final List<StoryModel> storyList;
  final double height;

  const StoryProfileWidget({
    super.key,
    required this.storyList,
    this.height = Dimensions.storyWisgetHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        scrollDirection: Axis.horizontal,
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          final story = storyList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            child: Column(
              children: [
                StoryAvatarWidget(
                  imageUrl: story.image,
                  isLive: story.isLive,
                  size: Dimensions.storiesAvaterSize,
                ),
                const GapY(value: 6),
                SizedBox(
                  width: Dimensions.storiesAvaterSize,
                  child: Text(
                    story.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: interBold.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class StoryAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isLive;
  final double size;

  const StoryAvatarWidget({
    super.key,
    required this.imageUrl,
    this.isLive = false,
    this.size = 68,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:AppConstants.storyGradient,
          ),
        ),

        // ⚪ White gap
        Container(
          width: size - 6,
          height: size - 6,
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
        ),

        // 🖼 Profile image
        ImageWidget(
          imageUrl,
          payload: ImagePayloadModel(
            isCircular: true,
            height: size - 10,
            width: size - 10,
            fit: BoxFit.cover,
            isProfileImage: true,
          ),
        ),

        if (isLive)
          Positioned(
            bottom: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'LIVE',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: Dimensions.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
