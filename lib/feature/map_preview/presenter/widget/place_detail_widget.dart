import 'package:asgard_world/feature/map_preview/data/model/places_model.dart';
import 'package:asgard_world/utility/extension/widget_extension.dart';
import 'package:flutter/material.dart';

class PlaceDetailWidget extends StatelessWidget {
  final PlacesModel place;

  const PlaceDetailWidget({super.key, required this.place});

  Widget _titleWidget(BuildContext context) {
    return Text(
      place.name ?? "",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _subTitleWidget(BuildContext context) {
    return Text(
      place.vicinity ?? "",
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget _ratingWidget(BuildContext context) {
    return Text(
      "Rating: ${place.rating}✯",
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = [];
    if (place.name != null) {
      columnChildren.add(_titleWidget(context));
    }

    if (place.vicinity != null) {
      columnChildren.add(_subTitleWidget(context));
    }

    if (place.rating != null) {
      columnChildren.add(_ratingWidget(context).addPadding(top: 8));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }
}
