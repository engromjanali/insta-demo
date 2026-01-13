

import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/profile/domain/model/profile_model.dart';

abstract class ProfileRepository {
  Future<List<StoryModel>> fetchStorieList();
  Future<ProfileModel> fetchProfile();
}
