import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/hotel_model.dart';

part 'hotel_repository.g.dart';

@riverpod
HotelRepository hotelRepository(HotelRepositoryRef ref) => HotelRepository();

class HotelRepository {
  Future<List<HotelModel>> getHotels() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return HotelModel.sampleHotels;
      },
    );
  }

  Future<HotelModel> getHotel(String coffeeId) async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return HotelModel.sampleHotels
            .where((coffee) => coffee.id == coffeeId)
            .first;
      },
    );
  }
}
