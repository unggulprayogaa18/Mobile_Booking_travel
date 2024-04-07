import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/hotel_repository.dart';
import '../widgets/custom_marker_generator.dart';
import '../widgets/map_marker_widget.dart';
import 'selected_hotel_provider.dart';

part 'map_markers_provider.g.dart';

@riverpod
class MapMarkers extends _$MapMarkers {
  @override
  Future<Set<MarkerWidget>> build() async {
    final HotelRepository hotelRepository = ref.watch(hotelRepositoryProvider);

    Set<MarkerWidget> markerWidgets = (await hotelRepository.getHotels())
        .map(
          (hotel) => MarkerWidget(
            marker: Marker(
              markerId: MarkerId(hotel.coordinate.toString()),
              position: hotel.coordinate,
              onTap: () {
                ref
                    .read(selectedHotelProvider.notifier)
                    .setSelectedHotel(hotel.id);
              },
            ),
            widget: MapMarkerPrice(price: '\$${hotel.price}'),
          ),
        )
        .toSet();
    return markerWidgets;
  }
}
