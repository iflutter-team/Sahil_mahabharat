import 'package:firebase_database/firebase_database.dart';
import 'package:mahabharat/json_model/video_model.dart';

class FireBaseService {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<List<UserVideo>?> getVideo(String key) async {
    List<UserVideo> userVideo = [];

    DatabaseReference reference = database.ref(key);
    await reference.get().then(
      (value) {
        Map data = value.value as Map;
        data.forEach((key, value) {
          int id = int.parse(key.toString().substring(2));
          value["id"] = id;
          UserVideo vid = UserVideo.fromJson(value);
          userVideo.add(vid);
        });
        userVideo.sort(
          (a, b) => a.id.compareTo(b.id),
        );
      },
    );
    if (userVideo.isNotEmpty) {
      return userVideo;
    } else {
      return null;
    }
  }
}

// String fullKey = "";
// for (int i = 1; i <= 94; i++) {
//   if (i <= 9) {
//     fullKey = 'ep0$i';
//   } else {
//     fullKey = 'ep$i';
//   }
// }
