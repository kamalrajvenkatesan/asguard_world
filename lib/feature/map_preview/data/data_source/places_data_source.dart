import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:dio/dio.dart';

class PlacesDataSource {
  Future<PlacesListModel?> getPlaces(
      {required Map<String, dynamic> queryParameters}) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json",
          queryParameters: queryParameters);
      print(response.data);

      if (response.data != null) {
        return PlacesListModel.fromJSON(response.data!);
      } else {
        throw Exception("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
