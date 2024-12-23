import 'package:get/get.dart';

import '../controllers/events_gatherings_controller.dart';

class EventsGatheringsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsGatheringsController>(
      () => EventsGatheringsController(),
    );
  }
}
