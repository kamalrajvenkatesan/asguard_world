import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:get/get.dart';

class MapPreviewController extends GetxController {
  MapViewOption selectedValue =
      MapViewOption.resturant; // By Default resturant will be selected

  void updateMapViewSelection(MapViewOption newValue) {
    selectedValue = newValue;
    update();
  }
}
