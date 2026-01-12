import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:insta/core/constants/app_constants.dart';
import 'package:insta/feature/home/domain/model/post_model.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';
import 'package:insta/feature/home/domain/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  List<StoryModel> _storyList = [];
  List<StoryModel> get storyLit => _storyList;

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  void fetchStories()async{
    _storyList =  await _homeRepository.fetchStorieList();
    update();
  }
  void fetchPosts()async{
   _posts = await _homeRepository.fetchPostList();
    update();
  }
}
