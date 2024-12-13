import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class RideRequestController extends GetxController {
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    _createCustomMarker();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _createCustomMarker() async {
    final markerImage = await _createMarkerImage();
    if (markerImage != null) {
      markers.add(
        Marker(
          markerId: MarkerId('customMarker'),
          position: LatLng(37.42796133580664, -122.085749655962),
          icon: BitmapDescriptor.bytes(markerImage),
        ),
      );
    }
  }

  Future<Uint8List?> _createMarkerImage() async {
    try {
      final GlobalKey repaintBoundaryKey = GlobalKey();

      // Build the widget into an off-screen widget tree
      final markerWidget = MaterialApp(
        home: Scaffold(
          body: RepaintBoundary(
            key: repaintBoundaryKey,
            child: Center(
              child: Card(
                elevation: 0,
                color: Colors.blue, // Replace with your desired color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
                  child: Text(
                    'Lyft',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          Colors.black, // Replace with your desired text color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Render the widget to an image
      final RenderRepaintBoundary boundary =
          await _captureWidget(markerWidget, repaintBoundaryKey);

      // Convert the boundary to an image
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      return byteData?.buffer.asUint8List();
    } catch (e) {
      print('Error creating marker image: $e');
      return null;
    }
  }

  Future<RenderRepaintBoundary> _captureWidget(
      Widget widget, GlobalKey key) async {
    final BuildOwner buildOwner = BuildOwner();
    final PipelineOwner pipelineOwner =
        PipelineOwner(onSemanticsOwnerCreated: () {});
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    final RenderView renderView = RenderView(
      child: repaintBoundary,
      configuration: ViewConfiguration(devicePixelRatio: 3.0),
      view: ui.window,
    );

    final RenderObjectToWidgetElement<RenderBox> renderObjectToWidgetElement =
        RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(renderObjectToWidgetElement);
    buildOwner.finalizeTree();
    pipelineOwner.flushLayout();

    return repaintBoundary;
  }
}
