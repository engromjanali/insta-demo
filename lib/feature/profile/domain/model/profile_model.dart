class ProfileModel {
  final String id;
  final String name;
  final String bio;
  final int postCount;
  final int followersCount;
  final int followingCount;
  final String profileImage;

  ProfileModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.postCount,
    required this.followersCount,
    required this.followingCount,
    required this.profileImage,
  });

  /// From JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      postCount: json['postCount'] ?? 0,
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      profileImage: json['profileImage'] ?? '',
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'postCount': postCount,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'profileImage': profileImage,
    };
  }
}
