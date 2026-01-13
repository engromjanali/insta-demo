import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/profile/domain/model/profile_model.dart';
import 'package:insta/feature/profile/domain/repository/home_repository.dart';


class ProfileController extends GetxController {
  final ProfileRepository _ProfileRepository;
  ProfileController(this._ProfileRepository);

  List<StoryModel> _storyList = [];
  List<StoryModel> get storyLit => _storyList;

  ProfileModel _profileModel =ProfileModel(id: "0", name: "N/A", bio: "N/A", postCount: 0, followersCount: 0, followingCount: 0, profileImage: "");
  ProfileModel get profileModel => _profileModel;

  void fetchStories()async{
    _storyList =  await _ProfileRepository.fetchStorieList();
    update();
  }
  void fetchProfile()async{
    _profileModel =  await _ProfileRepository.fetchProfile();
    update();
  }
}
