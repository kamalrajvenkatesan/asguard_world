import 'package:asgard_world/feature/map_preview/data/repository/places_repository_impl.dart';
import 'package:asgard_world/feature/map_preview/data/request_model/places_request_model.dart';
import 'package:asgard_world/utility/extension/places_model_extension.dart';
import 'package:asgard_world/utility/usecases.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesUseCase extends UseCases<Set<Marker>, PlacesRequestModel> {
  @override
  Future<Set<Marker>> call(PlacesRequestModel params) async {
    try {
      final placesList =
          await PlacesRepositoryImpl().getPlaces(params.toQueryParams());
      if (placesList != null && placesList.results != null) {
        return placesList.results!
            .map((e) => e.toMarker())
            .whereType<Marker>()
            .toSet();
      } else {
        throw Exception("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
