import 'package:asgard_world/feature/map_preview/data/data_source/places_data_source.dart';
import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:asgard_world/feature/map_preview/domain/repository/places_repository.dart';

class PlacesRepositoryImpl extends PlacesRepository {
  @override
  Future<PlacesListModel?> getPlaces(Map<String, dynamic> queryParams) =>
      PlacesDataSource().getPlaces(queryParameters: queryParams);
}
