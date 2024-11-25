import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesListModel {
  final List<PlacesModel>? results;

  PlacesListModel({required this.results});

  factory PlacesListModel.fromJSON(Map<String, dynamic> json) {
    final resultsJson = json["results"];
    if (resultsJson != null && resultsJson is List) {
      return PlacesListModel(
          results: resultsJson.map((e) => PlacesModel.fromJSON(e)).toList());
    } else {
      return PlacesListModel(results: null);
    }
  }
}

class PlacesModel {
  final String? name;
  final String? placeId;
  final String? reference;
  final GeoMetryModel? geometry;
  final String? vicinity;
  final num? rating;

  PlacesModel({
    required this.name,
    required this.placeId,
    required this.reference,
    required this.geometry,
    required this.vicinity,
    required this.rating,
  });

  factory PlacesModel.fromJSON(Map<String, dynamic> json) {
    return PlacesModel(
      name: json["name"],
      placeId: json["place_id"],
      reference: json["reference"],
      geometry: GeoMetryModel.fromJSON(
        json["geometry"],
      ),
      vicinity: json["vicinity"],
      rating: json["rating"],
    );
  }
}

class GeoMetryModel {
  final LatLng? location;

  GeoMetryModel({required this.location});

  factory GeoMetryModel.fromJSON(Map<String, dynamic> json) {
    return GeoMetryModel(location: latLngFromJSON(json["location"]));
  }
}

LatLng latLngFromJSON(Map<String, dynamic> json) {
  return LatLng(json["lat"], json["lng"]);
}
