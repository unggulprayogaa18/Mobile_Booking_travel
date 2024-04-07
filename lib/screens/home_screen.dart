import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../models/hotel_model.dart';
import '../providers/all_hotels_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_container.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/hotel_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: CustomNavBar(index: 0),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.25),
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    _HeaderSection(),
                    _SearchCard(),
                    SizedBox(height: 20),
                    _NearbyHotelSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: Assets.image.photo.provider(),
            ),
            CustomIconButton(
              icon: Assets.icon.notification.svg(height: 25),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Welcome back 👋',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationTextController = TextEditingController();
    final dateFromTextController = TextEditingController();
    final dateToTextController = TextEditingController();

    locationTextController.text = 'Yogyakarta';
    dateFromTextController.text = dateToTextController.text =
        DateFormat('dd MMM yyyy').format(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorName.lightGrey.withAlpha(50),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Assets.icon.location.svg(color: ColorName.blue),
              const SizedBox(width: 16),
              CustomTextField(
                label: 'Where',
                controller: locationTextController,
              ),
            ],
          ),
          Row(
            children: [
              Assets.icon.calendar.svg(color: ColorName.blue),
              const SizedBox(width: 16),
              CustomTextField(
                label: 'From',
                controller: dateFromTextController,
              ),
              CustomTextField(
                label: 'to',
                controller: dateToTextController,
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonText: 'Search',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _NearbyHotelSection extends ConsumerWidget {
  const _NearbyHotelSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotels = ref.watch(allHotelsProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Nearby hotels',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: ColorName.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        hotels.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
          data: (hotels) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                HotelModel hotel = hotels[index];
                return HotelCard(hotel: hotel);
              },
            );
          },
        ),
      ],
    );
  }
}
