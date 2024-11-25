class PlacesRequestModel {
  final String location;
  final String type;

  PlacesRequestModel({required this.location, required this.type});

  Map<String, dynamic> toQueryParams() {
    return {
      "location": location,
      "type": type,
      "radius": "1500",
      "key": "AIzaSyBwGtQLDWWKLdctxYyW-nvzRqZMaTUV9II",
    };
  }
}
