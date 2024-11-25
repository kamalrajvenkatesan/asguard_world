import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';

abstract class PlacesRepository {
  Future<PlacesListModel?> getPlaces(Map<String, dynamic> queryParams);
}
