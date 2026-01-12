import 'package:flutter/material.dart';
import 'package:insta/core/model/language_model.dart';
import 'package:insta/core/util/images.dart';

class AppConstants {
  static const String appName = 'Instagram';
  static const String appVersion = '3.5';

  /// Flutter SDK : 3.38.1
  static const String baseUrl = 'https://grofresh-test.6amdev.xyz';

  static const String encryption = "encryption";
  static const String noFee = "N/A";
  static const String noName = "N/A";
  static const int phoneNumberLength = 11;
  static const int textMaxLength = 100;
  static const int textAreaMaxLength = 1000;
  static const List<String> allowedFileTypes = ['jpg', 'pdf', 'png'];
  static const int minDOBDate = 1900;
  static const int passwordMinLength = 8;

  static const int limit = 20;
  static const foodImage =
      "https://res.cloudinary.com/dskavcx9z/image/upload/v1764069418/o_1_wxxucl.png";
  static const profile =
      "https://res.cloudinary.com/dskavcx9z/image/upload/image_ohzaod.jpg";

  // ======================== end points ==============================
  static const String fetchProfile = "/api/v1/customer/info";
  static const String updateProfile = "/api/v1/customer/update-profile";
  static const String signIn = "/api/v1/auth/login";
  static const String register = "/api/v1/auth/register";
  static const String config = "/api/v1/config";
  static const String customerImageUrl = "/storage/app/public/profile/";

  /// Shared Key

  /// ==============
  static const defaultAnimationDuration = Duration(milliseconds: 300);

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.us,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.bn,
      languageName: 'বাংলা',
      countryCode: 'BD',
      languageCode: 'bn',
    ),
    LanguageModel(
      imageUrl: Images.ar,
      languageName: 'عربى',
      countryCode: 'SA',
      languageCode: 'ar',
    ),
    LanguageModel(
      imageUrl: Images.india,
      languageName: 'Hindi',
      countryCode: 'IN',
      languageCode: 'hi',
    ),
  ];
  static LinearGradient get storyGradient => LinearGradient(
    colors: [
      const Color(0xFFFEDA75),
      const Color(0xFFFA7E1E),
      const Color(0xFFD62976),
      const Color(0xFF962FBF),
      const Color(0xFF4F5BD5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
