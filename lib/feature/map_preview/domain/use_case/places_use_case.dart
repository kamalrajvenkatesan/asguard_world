import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:asgard_world/feature/map_preview/data/repository/places_repository_impl.dart';
import 'package:asgard_world/feature/map_preview/data/request_model/places_request_model.dart';
import 'package:asgard_world/utility/usecases.dart';

class PlacesUseCase extends UseCases<List<PlacesModel>?, PlacesRequestModel> {
  @override
  Future<List<PlacesModel>?> call(PlacesRequestModel params) async {
    try {
      final placesList =
          await PlacesRepositoryImpl().getPlaces(params.toQueryParams());
      if (placesList != null && placesList.results != null) {
        return placesList.results;
      } else {
        throw Exception("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
