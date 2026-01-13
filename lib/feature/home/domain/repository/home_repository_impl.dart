
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/feature/home/domain/model/post_model.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<PostModel>> fetchPostList() async {
    return [
      PostModel("romjan", AppConstants.profile, isLive: true, subtitle: 'dhaka, bangladesh',lastComment : 'The game in Japan was amazing and I want to share some photos, The game in Japan was amazing and I want to share some photos, The game in Japan was amazing'),
      PostModel("sayed", AppConstants.foodImage, isLive: false, lastComment:  'Nice', subtitle: 'Cox\'s bazer'),
      PostModel("romjan", "Image", isLive: true, subtitle: 'dhaka, bangladesh',lastComment : 'photos, The game in Japan was amazing'),
      PostModel("shariyar", AppConstants.foodImage, isLive: false, lastComment:  'The game in Japan was amazing and I want to share some photos, The game in Japan was amazing and I want to share some photos, The game in Japan was amazing', subtitle: 'Cox\'s bazer'),
      PostModel("Noman", AppConstants.profile, isLive: true, subtitle: 'dhaka, bangladesh',lastComment : 'The game in  some photos, The game in Japan was amazing and I want to share some photos, The game in Japan was amazing'),
      PostModel("sayed", AppConstants.foodImage, isLive: false, lastComment:  'are some photos, The game in Japan was amazing and I want to share some photos, The game in Japan was amazing', subtitle: 'Cox\'s bazer'),

    ];
  }

  @override
  Future<List<StoryModel>> fetchStorieList() async {
    return [
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
    ];
  }
}
