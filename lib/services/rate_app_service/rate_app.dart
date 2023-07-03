import 'package:get/get.dart';
import 'package:mahabharat/services/service_utils/url_res.dart';
import 'package:url_launcher/url_launcher.dart';

class RateAppController extends GetxController {
  final Uri _url = Uri.parse(UrlRes.rateApp);
  final Uri _more = Uri.parse(UrlRes.moreApp);

  ///----------------------------Rate App--------------------------------///
  void rateApp() {
    rateCondition();
    update(["rateApp", "rateAppSetting"]);
  }

  Future<void> rateCondition() async {
    if (!await launchUrl(_url)) {
      throw Exception("Could not launch$_url");
    }
  }

  ///--------------------------------------------More App------------------------------///
  moreApp() {
    moreCondition();
    update(["moreApp"]);
  }

  moreCondition() async {
    if (!await launchUrl(_more)) {
      throw Exception("Could not launch$_more");
    }
  }
}
