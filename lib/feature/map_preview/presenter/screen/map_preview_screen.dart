import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:asgard_world/feature/map_preview/presenter/controller/map_preview_controller.dart';
import 'package:asgard_world/feature/map_preview/presenter/widget/place_detail_widget.dart';
import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:asgard_world/utility/extension/places_model_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewScreen extends StatelessWidget {
  const MapPreviewScreen({super.key});

  void _showPlacesDetailPopup(BuildContext context,
          {required PlacesModel place}) =>
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: PlaceDetailWidget(place: place)));

  Widget _segmentSelectorWidget(
      {required Function(MapViewOption) onSelection,
      required MapViewOption selected}) {
    ButtonSegment<MapViewOption> getButtonSegment(MapViewOption view) {
      return ButtonSegment<MapViewOption>(
          value: view, icon: Icon(view.buttonIcon));
    }

    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: SegmentedButton<MapViewOption>(
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.black;
        }), backgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return const Color(0xFF6a1e6f);
          }
          return Colors.white;
        })),
        segments: [
          getButtonSegment(MapViewOption.cycle),
          getButtonSegment(MapViewOption.shopping),
          getButtonSegment(MapViewOption.resturant),
        ],
        selected: <MapViewOption>{selected},
        showSelectedIcon: false,
        onSelectionChanged: (value) {
          onSelection(value.first);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapPreviewController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(controller.selectedValue.title),
            ),
            floatingActionButton: _segmentSelectorWidget(
                onSelection: controller.updateMapViewSelection,
                selected: controller.selectedValue),
            body: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: controller.location ?? controller.defaultLoation,
                zoom: 12,
              ),
              markers: controller.places
                      ?.map((e) => e.toMarker(() {
                            _showPlacesDetailPopup(context, place: e);
                          }))
                      .toList()
                      .whereType<Marker>()
                      .toSet() ??
                  {},
              onMapCreated: (mapController) {
                controller.mapController = mapController;
                controller.setUserCurrentLocation();
              },
            ),
          );
        });
  }
}
