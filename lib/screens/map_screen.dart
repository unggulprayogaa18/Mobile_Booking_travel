import 'package:flutter/material.dart';
import 'package:uts_hotel_puputunggulprayoga/providers/selected_hotel_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/map_location_provider.dart';
import '../providers/map_markers_provider.dart';
import '../widgets/custom_map.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/hotel_card.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapLocation = ref.watch(mapLocationProvider);
    final mapMarkers = ref.watch(mapMarkersProvider);
    final selectedHotel = ref.watch(selectedHotelProvider);

    return Scaffold(
      bottomNavigationBar: CustomNavBar(index: 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: mapMarkers.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (mapMarkers) {
          return Stack(
            children: [
              CustomMap(
                initialCameraPosition: CameraPosition(
                  target: mapLocation,
                  zoom: 12.5,
                ),
                markerWidgets: mapMarkers.toList(),
                // onCameraMove: (position) {
                //   ref
                //       .read(mapLocationProvider.notifier)
                //       .setMapLocation(position.target);
                // },
              ),
              selectedHotel.maybeWhen(
                data: (hotel) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: HotelCard(hotel: hotel),
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              )
            ],
          );
        },
      ),
    );
  }
}
