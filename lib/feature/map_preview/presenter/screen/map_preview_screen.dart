import 'package:asgard_world/feature/map_preview/presenter/controller/map_preview_controller.dart';
import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewScreen extends StatelessWidget {
  const MapPreviewScreen({super.key});

  Widget _segmentSelectorWidget(
      {required Function(MapViewOption) onSelection,
      required MapViewOption selected}) {
    ButtonSegment<MapViewOption> getButtonSegment(MapViewOption view) {
      return ButtonSegment<MapViewOption>(
          value: view, icon: Icon(view.buttonIcon));
    }

    return Container(
      height: 60,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: SegmentedButton<MapViewOption>(
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
              markers: controller.markers,
              onMapCreated: (mapController) {
                controller.mapController = mapController;
                controller.setUserCurrentLocation();
              },
            ),
          );
        });
  }
}
