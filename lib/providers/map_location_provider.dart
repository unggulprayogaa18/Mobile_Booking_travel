import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_location_provider.g.dart';

@riverpod
class MapLocation extends _$MapLocation {
  @override
  LatLng build() {
    return LatLng(-7.795529617707741, 110.36872726427349);
  }

  void setMapLocation(LatLng position) {
    state = position;
  }
}
