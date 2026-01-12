import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta/core/helper/public_method.dart';
import 'package:insta/core/model/image_payload_model.dart';
import 'package:insta/core/util/asset_icons.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/widget/shimmer_widget.dart';

/// 🖼️ ImageWidget
/// A flexible image widget that:
/// ✅ Loads from network
/// 🔄 Shows loading spinner while fetching
/// 🚨 Displays fallback image on error
/// 🔵 Can be shown in a circular frame with [isCircular]
/// 📐 Respects [height], [width], and [fit] for layout.
class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final ImagePayloadModel? payload;

  const ImageWidget(this.imageUrl, {super.key, this.payload});

  bool _isNetworkUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith("http://") ||
        url.startsWith("https://") ||
        // for web limage picker return :
        url.startsWith("blob:http:");
  }

  bool _isFileUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith("file://") || url.startsWith("/");
  }

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(imageUrl: imageUrl!);

    // print("url:$imageUrl");

    final double finalHeight = payload?.height ?? Dimensions.imageDefaultX;
    final double finalWidth = payload?.width ?? Dimensions.imageDefaultX;

    Widget imageWidget;
    // printer("go");
    if (_isNetworkUrl(imageUrl)) {
      // printer("yes");
      // 🌐 Load from network with caching + shimmer placeholder
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl!,
        height: finalHeight,
        width: finalWidth,
        fit: payload?.fit ?? BoxFit.cover,
        placeholder: (context, url) => _WShimmerPlaceholder(
          width: finalWidth,
          height: finalHeight,
          isCircular: false,
        ),
        errorWidget: (context, url, error) => _WFallbackImage(payload),
      );
    } else if (_isFileUrl(imageUrl)) {
      // 📂 Load from local file
      imageWidget = Image.file(
        File(imageUrl!.replaceFirst("file://", "")),
        height: finalHeight,
        width: finalWidth,
        fit: payload?.fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          errorPrint(error);
          return _WFallbackImage(payload);
        },
      );
    } else {
      // ❌ Invalid/empty url
      imageWidget = _WFallbackImage(payload);
    }

    // 🔵 Optional: Circular crop
    if (payload?.isCircular == true) {
      return ClipOval(
        child: SizedBox(
          height: finalHeight,
          width: finalWidth,
          child: imageWidget,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(payload?.borderRadius ?? 0.0),
      child: imageWidget,
    );
  }
}

class _WShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircular;

  const _WShimmerPlaceholder({
    required this.width,
    required this.height,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: isCircular
              ? BorderRadius.circular(width / 2)
              : BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _WFallbackImage extends StatelessWidget {
  final ImagePayloadModel? payload;

  const _WFallbackImage(this.payload);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      payload?.isProfileImage == true
          ? AssetIcons.profileActive
          : AssetIcons.imageNotFound,
      height: payload?.height ?? Dimensions.imageDefaultY,
      width: payload?.width ?? Dimensions.imageDefaultX,
      fit: payload?.fit ?? BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Theme.of(context).primaryColor!,
        BlendMode.srcIn,
      ),
    );
  }
}
