import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewController extends GetxController {
  MapViewOption selectedValue =
      MapViewOption.resturant; // By Default resturant will be selected
  LatLng location = const LatLng(12.9716, 77.5946);

  MapPreviewController() {
    _setUserCurrentLocation();
  }

  void updateMapViewSelection(MapViewOption newValue) {
    selectedValue = newValue;
    update();
  }

  Future<bool> _isPermissionGranted(LocationPermission permission) async {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      case LocationPermission.denied:
        final newPermission = await Geolocator.requestPermission();
        return _isPermissionGranted(newPermission);
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        return false;
    }
  }

  void _setUserCurrentLocation() async {
    if (await _isPermissionGranted(await Geolocator.checkPermission())) {
      final position = await Geolocator.getCurrentPosition();
      location = LatLng(position.latitude, position.longitude);
      update();
    }
    // Else is not required as user is not granted permission to access current location
  }
}
