import 'package:insta/feature/home/domain/model/post_model.dart';
import 'package:insta/feature/home/domain/model/story_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> fetchPostList();
  Future<List<StoryModel>> fetchStorieList();
}
