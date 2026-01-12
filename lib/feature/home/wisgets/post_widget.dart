import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/core/extensions/expaanded_extension.dart';
import 'package:insta/core/model/image_payload_model.dart';
import 'package:insta/core/util/asset_icons.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/dimensions_widget.dart';
import 'package:insta/core/widget/icon_widget.dart';
import 'package:insta/core/widget/image_widget.dart';
import 'package:insta/feature/home/domain/model/post_model.dart';

class PostWidget extends StatelessWidget {
  final List<PostModel> list;
  const PostWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Container(
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                ImageWidget(
                  AppConstants.profile,
                  payload: ImagePayloadModel(
                    isCircular: true,
                    isProfileImage: true,
                  ),
                ),
                GapX(value: Dimensions.paddingSizeLarge),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].name,
                      style: interBold.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                      ),
                    ).paddingOnly(bottom: 2),
                    Text(
                      list[index].subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: interRegular.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                      ),
                    ),
                  ],
                ).expd(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_sharp),
                ),
              ],
            ).paddingSymmetric(horizontal: Dimensions.paddingSizeLarge),
            ImageWidget(
              list[index].image,
              payload: ImagePayloadModel(
                isCircular: true,
                isProfileImage: true,
                width: double.infinity,
              ),
            ).expd(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: Dimensions.paddingSizeLarge,
                  children: [
                    IconWidget(path: AssetIcons.reels),
                    IconWidget(path: AssetIcons.comment),
                    IconWidget(path: AssetIcons.share),
                    Spacer(),
                    Spacer(),
                    IconWidget(path: AssetIcons.saved),
                  ],
                ),
                GapY(value: Dimensions.paddingSizeDefault),

                Row(
                  children: [
                    ImageWidget(
                      AppConstants.profile,
                      payload: ImagePayloadModel(
                        isCircular: true,
                        isProfileImage: true,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    GapX(value: Dimensions.paddingSizeLarge),

                    Text(
                      "Liked by Siam And 23234 others",
                      style: interRegular.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                GapY(value: Dimensions.paddingSizeSmall),

                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: list[index].subtitle,
                        style: interBold.copyWith(
                          fontSize: Dimensions.fontSizeExtraSmall,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: list[index].lastComment,
                        style: interRegular.copyWith(
                          fontSize: Dimensions.fontSizeExtraSmall,
                          fontWeight: FontWeight.normal,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: Dimensions.paddingSizeLarge),
          ],
        ),
      ).paddingOnly(bottom: Dimensions.paddingSizeExtraLarge),
    );
  }
}
