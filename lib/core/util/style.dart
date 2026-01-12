import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

const encodeSansRegular = TextStyle(
  fontFamily: 'Encode Sans',
  fontWeight: FontWeight.w400,
);

const encodeSansBold = TextStyle(
  fontFamily: 'Encode Sans',
  fontWeight: FontWeight.w700,
);

// Inter Styles
const interRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);

const interSemiBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

const interBold = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700);

// SF Pro Rounded Styles
const sfProRoundedRegular = TextStyle(
  fontFamily: 'SF Pro Rounded',
  fontWeight: FontWeight.w400,
);

const sfProRoundedBold = TextStyle(
  fontFamily: 'SF Pro Rounded',
  fontWeight: FontWeight.w600,
);

// DM Sans Styles
const dmSansBold = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w700,
);

/// header: "hello, Welcome"
const helloWelcomeTextStyle = TextStyle(
  fontFamily: 'Encode Sans',
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

/// header: User Name
const userNameTextStyle = TextStyle(
  fontFamily: 'Encode Sans',
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

/// Tab Bar Text
const tabBarTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

/// Search Bar Text
const searchBarTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  fontSize: 13,
);

/// Section Title ("One Time Deal", "Top Stores")
const sectionTitleTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  fontSize: 11,
);

/// "View All" Button Text
const viewAllTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

/// Bottom Navigation Bar Selected Item
const bottomNavSelectedTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  fontSize: 12,
);

/// "Ends in" Label Text
const endsInLabelTextStyle = TextStyle(
  fontFamily: 'SF Pro Rounded',
  fontWeight: FontWeight.w400,
  fontSize: 10,
);

/// "Ends in" Time Text
const endsInTimeTextStyle = TextStyle(
  fontFamily: 'SF Pro Rounded',
  fontWeight: FontWeight.w600,
  fontSize: 11,
);

/// Product Title
const productTitleTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

/// Product Price
const productPriceTextStyle = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w700,
  fontSize: 13,
);

/// Discounted Price (Old Price)
const discountedPriceTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  fontSize: 11,
  decoration: TextDecoration.lineThrough,
);

/// Discount Percentage Badge
const discountPercentageTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  fontSize: 10,
);

/// Product Tab Buttons (New Arrivals, Discounted Products, Top Products)
const productTabTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  fontSize: 12,
);

const robotoBold = TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700);

List<BoxShadow>? searchBoxShadow = [
  BoxShadow(
    offset: Offset(0, 4),
    color: Colors.black.withValues(alpha: 0.05),
    blurRadius: 14,
    spreadRadius: 0,
  ),
];

List<BoxShadow> cardShadow = [
  const BoxShadow(
    offset: Offset(0, 2),
    spreadRadius: 2,
    blurRadius: 2,
    color: Color(0x20A8A8EA),
  ),
];

List<BoxShadow>? lightShadow = Get.isDarkMode
    ? [const BoxShadow()]
    : [
        const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 1,
          color: Color(0x20D6D8E6),
        ),
      ];
