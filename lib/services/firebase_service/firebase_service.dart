import 'package:firebase_database/firebase_database.dart';
import 'package:mahabharat/json_model/video_model.dart';

class FireBaseService {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<List<UserVideo>?> getVideo(String key) async {
    List<UserVideo> userVideo = [];

    String fullKey = "";
    for (int i = 1; i <= 94; i++) {
      if (i <= 9) {
        fullKey = 'ep0$i';
      } else {
        fullKey = 'ep$i';
      }

      DatabaseReference reference = database.ref(key).child(fullKey);
      await reference.get().then(
        (value) {
          Map data = value.value as Map;

          UserVideo vid = UserVideo.fromJson(data);
          userVideo.add(vid);
        },
      );
    }
    if (userVideo.isNotEmpty) {
      return userVideo;
    } else {
      return null;
    }
  }
}
