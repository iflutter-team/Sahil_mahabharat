import 'dart:convert';

UserVideo userVideoFromJson(String str) => UserVideo.fromJson(json.decode(str));

// String userVideoToJson(UserVideo data) => json.encode(data.toJson());

class UserVideo {
  int id;
  String? imageurl;
  String? title;
  String? videourl;

  UserVideo({
    required this.id,
    this.imageurl,
    this.title,
    this.videourl,
  });

  factory UserVideo.fromJson(Map json) => UserVideo(
        id: json["id"] ?? 0,
        imageurl: json["imageurl"],
        title: json["title"],
        videourl: json["videourl"],
      );
}
