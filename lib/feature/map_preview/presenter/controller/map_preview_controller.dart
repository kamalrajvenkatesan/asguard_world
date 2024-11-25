import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:asgard_world/feature/map_preview/data/request_model/places_request_model.dart';
import 'package:asgard_world/feature/map_preview/domain/use_case/places_use_case.dart';
import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewController extends GetxController {
  MapViewOption selectedValue =
      MapViewOption.resturant; // By Default resturant will be selected
  LatLng? location;
  final defaultLoation = const LatLng(12.9716, 77.5946);
  GoogleMapController? mapController;
  List<PlacesModel>? places;

  void _updateMarkers() async {
    try {
      final selectedLocation = location ?? defaultLoation;
      places = await PlacesUseCase().call(PlacesRequestModel(
          location:
              "${selectedLocation.latitude}, ${selectedLocation.longitude}",
          type: selectedValue.typeString));

      update();
    } catch (e) {
      // Show Error
      print(e);
    }
  }

  void updateMapViewSelection(MapViewOption newValue) {
    selectedValue = newValue;
    update();
    _updateMarkers();
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

  void setUserCurrentLocation() async {
    if (await _isPermissionGranted(await Geolocator.checkPermission())) {
      final position = await Geolocator.getCurrentPosition();
      location = LatLng(position.latitude, position.longitude);
      mapController?.animateCamera(CameraUpdate.newLatLng(location!));
      update();
      _updateMarkers();
    }
    // Else is not required as user is not granted permission to access current location
  }
}
