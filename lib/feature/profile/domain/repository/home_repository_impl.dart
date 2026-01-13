import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/profile/domain/model/profile_model.dart';
import 'package:insta/feature/profile/domain/repository/home_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<List<StoryModel>> fetchStorieList() async {
    return [
      StoryModel("Md Romjan Ali", AppConstants.profile, isLive: true),
      StoryModel("Md Shariyar kabir", AppConstants.foodImage, isLive: false),
    ];
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    return ProfileModel(
      id: "121",
      name: "Md Romjan Ali",
      bio: "Digital goodies designer @pixsellz \nEverything is designed.",
      postCount: 2321,
      followersCount: 243,
      followingCount: 253,
      profileImage: AppConstants.profile,
    );
  }
}
