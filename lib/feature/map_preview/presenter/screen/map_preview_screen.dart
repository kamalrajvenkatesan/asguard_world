import 'package:asgard_world/feature/map_preview/presenter/controller/map_preview_controller.dart';
import 'package:asgard_world/utility/enum/map_view_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPreviewScreen extends StatelessWidget {
  const MapPreviewScreen({super.key});

  Widget _segmentSelectorWidget(
      {required Function(MapViewOption) onSelection,
      required MapViewOption selected}) {
    ButtonSegment<MapViewOption> getButtonSegment(MapViewOption view) {
      return ButtonSegment<MapViewOption>(
          value: view, icon: Icon(view.buttonIcon));
    }

    return SegmentedButton<MapViewOption>(segments: [
      getButtonSegment(MapViewOption.cycle),
      getButtonSegment(MapViewOption.shopping),
      getButtonSegment(MapViewOption.resturant),
    ], selected: {
      selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapPreviewController(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("Explore Map"),
            ),
            floatingActionButton: _segmentSelectorWidget(
                onSelection: controller.updateMapViewSelection,
                selected: controller.selectedValue),
          );
        });
  }
}
