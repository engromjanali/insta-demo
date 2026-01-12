class PostModel{
  final String name;
  final String image;
  final bool isLive;
  final String lastComment;
  final String subtitle;
  PostModel(this.name, this.image, {required this.isLive, required this.lastComment, required this.subtitle});
}