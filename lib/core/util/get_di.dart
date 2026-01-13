
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/core/model/language_model.dart';
import 'package:insta/feature/home/controller/home_controller.dart';
import 'package:insta/feature/home/domain/repository/home_repository.dart';
import 'package:insta/feature/home/domain/repository/home_repository_impl.dart';
import 'package:insta/feature/profile/controller/profile_controller.dart';
import 'package:insta/feature/profile/domain/repository/home_repository.dart';
import 'package:insta/feature/profile/domain/repository/home_repository_impl.dart';

Future<Map<String, Map<String, String>>> init() async {

  /// datasource

  /// Repository
  Get.lazyPut<HomeRepository>(()=>HomeRepositoryImpl());
  Get.lazyPut<ProfileRepository>(()=>ProfileRepositoryImpl());
  
  /// Controller
  Get.lazyPut<HomeController>(()=>HomeController(Get.find()));
  Get.lazyPut<ProfileController>(()=>ProfileController(Get.find()));
  
  Map<String, Map<String, String>> languages = {};
  // await AppTranslations.loadTranslations();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString(
      '${kIsWeb ? "" : "assets"}/language/${languageModel.languageCode}.json',
    );
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> jsonValue = {};
    mappedJson.forEach((key, value) {
      jsonValue[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        jsonValue;
  }
  return languages;
}
