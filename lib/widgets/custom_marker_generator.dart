import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerGenerator extends StatefulWidget {
  const CustomMarkerGenerator({
    Key? key,
    required this.markerWidgets,
    required this.callbackAction,
  }) : super(key: key);

  final List<MarkerWidget> markerWidgets;
  final ValueChanged<List<Marker>> callbackAction;

  @override
  State<CustomMarkerGenerator> createState() => _CustomMarkerGeneratorState();
}

class _CustomMarkerGeneratorState extends State<CustomMarkerGenerator> {
  List<GlobalKey> globalKeys = [];

  @override
  void initState() {
    super.initState();
    globalKeys = widget.markerWidgets.map((marketWidget) {
      return GlobalKey();
    }).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildCompleted());
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        -MediaQuery.of(context).size.width * 2,
        -MediaQuery.of(context).size.height * 2,
      ),
      child: Stack(
        children: [
          for (var i = 0; i < widget.markerWidgets.length; i++)
            RepaintBoundary(
              key: globalKeys[i],
              child: widget.markerWidgets[i].widget,
            ),
        ],
      ),
    );
  }

  Future<void> _onBuildCompleted() async {
    final markers = await Future.wait(
      globalKeys.map(
        (key) => _convertToMarker(key),
      ),
    );
    widget.callbackAction(markers);
  }

  Future<Marker> _convertToMarker(GlobalKey key) async {
    final widgetMarker = widget.markerWidgets[globalKeys.indexOf(key)].marker;
    return Marker(
      onTap: widgetMarker.onTap,
      markerId: widgetMarker.markerId,
      position: widgetMarker.position,
      icon: await _widgetToIcon(key),
    );
  }

  static Future<BitmapDescriptor> _widgetToIcon(GlobalKey globalKey) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}

class MarkerWidget {
  final Widget widget;
  final Marker marker;

  const MarkerWidget({
    required this.marker,
    required this.widget,
  });
}
