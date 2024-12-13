import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutRestaurantController extends GetxController {
  Future<void> openMap(double lat, double longt,
      {LaunchMode linkLaunchMode = LaunchMode.externalApplication}) async {
    String googleurl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$longt';
    if (await canLaunchUrl(Uri.parse(googleurl))) {
      await launchUrl(Uri.parse(googleurl), mode: linkLaunchMode);
    } else {
      throw 'Could not open the map.';
    }
  }
}
