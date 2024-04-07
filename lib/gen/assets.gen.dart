/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  $AssetsIconAmenitiesGen get amenities => const $AssetsIconAmenitiesGen();

  /// File path: assets/icon/booking.svg
  SvgGenImage get booking => const SvgGenImage('assets/icon/booking.svg');

  /// File path: assets/icon/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icon/calendar.svg');

  /// File path: assets/icon/chevron-down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/icon/chevron-down.svg');

  /// File path: assets/icon/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icon/home.svg');

  /// File path: assets/icon/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icon/like.svg');

  /// File path: assets/icon/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icon/location.svg');

  /// File path: assets/icon/loupe.png
  AssetGenImage get loupe => const AssetGenImage('assets/icon/loupe.png');

  /// File path: assets/icon/map.svg
  SvgGenImage get map => const SvgGenImage('assets/icon/map.svg');

  /// File path: assets/icon/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icon/notification.svg');

  /// File path: assets/icon/pin.svg
  SvgGenImage get pin => const SvgGenImage('assets/icon/pin.svg');

  /// File path: assets/icon/pin_png.png
  AssetGenImage get pinPng => const AssetGenImage('assets/icon/pin_png.png');

  /// File path: assets/icon/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icon/profile.svg');

  /// File path: assets/icon/wishlist.svg
  SvgGenImage get wishlist => const SvgGenImage('assets/icon/wishlist.svg');

  /// List of all assets
  List<dynamic> get values => [
        booking,
        calendar,
        chevronDown,
        home,
        like,
        location,
        loupe,
        map,
        notification,
        pin,
        pinPng,
        profile,
        wishlist
      ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/gallery1.png
  AssetGenImage get gallery1 =>
      const AssetGenImage('assets/image/gallery1.png');

  /// File path: assets/image/gallery2.png
  AssetGenImage get gallery2 =>
      const AssetGenImage('assets/image/gallery2.png');

  /// File path: assets/image/gallery3.png
  AssetGenImage get gallery3 =>
      const AssetGenImage('assets/image/gallery3.png');

  /// File path: assets/image/hotel-image.png
  AssetGenImage get hotelImage =>
      const AssetGenImage('assets/image/hotel-image.png');

  /// File path: assets/image/photo.png
  AssetGenImage get photo => const AssetGenImage('assets/image/photo.png');

  /// File path: assets/image/sign-in.png
  AssetGenImage get signIn => const AssetGenImage('assets/image/sign-in.png');

  /// File path: assets/image/thumbnail1.png
  AssetGenImage get thumbnail1 =>
      const AssetGenImage('assets/image/thumbnail1.png');

  /// File path: assets/image/thumbnail2.png
  AssetGenImage get thumbnail2 =>
      const AssetGenImage('assets/image/thumbnail2.png');

  /// File path: assets/image/yoga.jpeg
  AssetGenImage get yoga => const AssetGenImage('assets/image/yoga.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        gallery1,
        gallery2,
        gallery3,
        hotelImage,
        photo,
        signIn,
        thumbnail1,
        thumbnail2,
        yoga
      ];
}

class $AssetsIconAmenitiesGen {
  const $AssetsIconAmenitiesGen();

  /// File path: assets/icon/amenities/ac.svg
  SvgGenImage get ac => const SvgGenImage('assets/icon/amenities/ac.svg');

  /// File path: assets/icon/amenities/hotel.svg
  SvgGenImage get hotel => const SvgGenImage('assets/icon/amenities/hotel.svg');

  /// File path: assets/icon/amenities/room_service.svg
  SvgGenImage get roomService =>
      const SvgGenImage('assets/icon/amenities/room_service.svg');

  /// File path: assets/icon/amenities/swimming_pool.svg
  SvgGenImage get swimmingPool =>
      const SvgGenImage('assets/icon/amenities/swimming_pool.svg');

  /// File path: assets/icon/amenities/transport.svg
  SvgGenImage get transport =>
      const SvgGenImage('assets/icon/amenities/transport.svg');

  /// File path: assets/icon/amenities/wifi.svg
  SvgGenImage get wifi => const SvgGenImage('assets/icon/amenities/wifi.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [ac, hotel, roomService, swimmingPool, transport, wifi];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
