import 'dart:convert';

UserVideo userVideoFromJson(String str) => UserVideo.fromJson(json.decode(str));

String userVideoToJson(UserVideo data) => json.encode(data.toJson());

class UserVideo {
  String? imageurl;
  String? title;
  String? videourl;

  UserVideo({
    this.imageurl,
    this.title,
    this.videourl,
  });

  factory UserVideo.fromJson(Map json) => UserVideo(
        imageurl: json["imageurl"],
        title: json["title"],
        videourl: json["videourl"],
      );

  Map<String, dynamic> toJson() => {
        "imageurl": imageurl,
        "title": title,
        "videourl": videourl,
      };
}
