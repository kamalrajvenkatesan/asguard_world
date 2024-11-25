import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PlacesModelExtension on PlacesModel {
  Marker? toMarker() {
    if (geometry?.location == null) {
      return null;
    }
    return Marker(
        markerId: MarkerId(
          name ?? DateTime.now().toString(),
        ),
        position: geometry!.location!,
        infoWindow: InfoWindow(title: name));
  }
}
