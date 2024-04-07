import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_hotel_puputunggulprayoga/screens/booking_screen.dart';
import 'package:uts_hotel_puputunggulprayoga/screens/profile_screen.dart';
import 'package:uts_hotel_puputunggulprayoga/screens/search_screen.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';
import '../screens/home_screen.dart';
import '../screens/map_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              iconPath: Assets.icon.home.path,
              text: 'Home',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => HomeScreen()),
                  ),
                );
              },
              isSelected: index == 0,
            ),
            _NavBarIcon(
              iconPath: Assets.icon.map.path,
              text: 'Map',
              isSelected: index == 1,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MapScreen()),
                  ),
                );
              },
            ),
             _NavBarIcon(
              
              iconPath: Assets.icon.like.path,
              text: 'Search',            
              isSelected: index == 2,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SearchScreen()),
                  ),
                );
              },
              ),

            _NavBarIcon(
              iconPath: Assets.icon.booking.path,
              text: 'Booking',            
              isSelected: index == 3,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => BookingScreen()),
                  ),
                );
              },
              ),
            _NavBarIcon(
              iconPath: Assets.icon.profile.path,
              text: 'Profile',
               isSelected: index == 4,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProfileScreen()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  const _NavBarIcon({
    Key? key,
    required this.iconPath,
    required this.text,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? ColorName.primaryColor : ColorName.lightGrey;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, color: color),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.workSans,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
