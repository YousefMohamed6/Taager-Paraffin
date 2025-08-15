import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapService
    with MarkerManager, PolylineManager, CircleManager, PolygonManager {
  // Default values
  double get defaultZoom => 15.0;
  double get defaultPadding => 16.0;
  LatLng get defaultCameraPosition => const LatLng(37.7749, -122.4194);
  CameraPosition get initialCameraPosition => CameraPosition(
        target: defaultCameraPosition,
        zoom: defaultZoom,
      );

  GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> addMapStyle(String stylePath) async {
    final String mapStyle = await rootBundle.loadString(stylePath);
    mapController?.setMapStyle(mapStyle);
  }

  Future<void> animateCameraToLocation({
    required LatLng latlng,
  }) async {
    await mapController?.animateCamera(
      CameraUpdate.newLatLng(latlng),
    );
  }

  Future<void> animateCameraPosition({
    required LatLng latlng,
    double? zoom,
  }) async {
    final CameraPosition cameraPosition = CameraPosition(
      target: latlng,
      zoom: zoom ?? defaultZoom,
    );
    await mapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  Future<void> animateCameraToLatLngBounds({
    required LatLngBounds latLngBounds,
    double? padding,
  }) async {
    await mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(latLngBounds, padding ?? defaultPadding),
    );
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    double southWestLatitude = points.first.latitude;
    double southWestLongitude = points.first.longitude;
    double northEastLatitude = points.first.latitude;
    double northEastLongitude = points.first.longitude;

    for (LatLng point in points) {
      southWestLatitude = min(southWestLatitude, point.latitude);
      southWestLongitude = min(southWestLongitude, point.longitude);
      northEastLatitude = max(northEastLatitude, point.latitude);
      northEastLongitude = max(northEastLongitude, point.longitude);
    }

    return LatLngBounds(
      southwest: LatLng(southWestLatitude, southWestLongitude),
      northeast: LatLng(northEastLatitude, northEastLongitude),
    );
  }

  void dispose() {
    mapController = null;
    markers.clear();
    polygons.clear();
    polylines.clear();
    circles.clear();
  }
}

mixin MarkerManager {
  Set<Marker> markers = <Marker>{};
  void addMarkerToLocation({
    required LatLng latlng,
    required String markerId,
    String? title,
    String? snippet,
    BitmapDescriptor? icon,
    double zIndex = 0,
    void Function(LatLng)? onDrag,
    void Function(LatLng)? onDragStart,
    void Function(LatLng)? onDragEnd,
    VoidCallback? onTap,
    VoidCallback? onInfoWindowTap,
  }) {
    final Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: latlng,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
        onTap: onInfoWindowTap,
      ),
      icon: icon ?? BitmapDescriptor.defaultMarker,
      zIndex: zIndex,
      draggable: onDrag != null ? true : false,
      onDrag: onDrag,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
      consumeTapEvents: onTap != null ? true : false,
      onTap: onTap,
    );
    markers.add(marker);
  }

  void removeMarker(String markerId) {
    markers.removeWhere((marker) => marker.markerId.value == markerId);
  }

  void updateMarker({
    required String markerId,
    LatLng? latlng,
    String? title,
    String? snippet,
    BitmapDescriptor? icon,
    double? zIndex,
    void Function(LatLng)? onDrag,
    void Function(LatLng)? onDragStart,
    void Function(LatLng)? onDragEnd,
    bool? draggable,
    VoidCallback? onTap,
    VoidCallback? onInfoWindowTap,
  }) {
    final Marker oldMarker = markers.firstWhere(
      (marker) => marker.markerId.value == markerId,
      orElse: () => throw Exception('Marker not found'),
    );
    removeMarker(markerId);
    final Marker updatedMarker = Marker(
      markerId: MarkerId(markerId),
      position: latlng ?? oldMarker.position,
      infoWindow: InfoWindow(
        title: title ?? oldMarker.infoWindow.title,
        snippet: snippet ?? oldMarker.infoWindow.snippet,
        onTap: onInfoWindowTap ?? oldMarker.infoWindow.onTap,
      ),
      icon: icon ?? oldMarker.icon,
      zIndex: zIndex ?? oldMarker.zIndex,
      draggable: draggable ?? oldMarker.draggable,
      onDrag: onDrag ?? oldMarker.onDrag,
      onDragStart: onDrag ?? oldMarker.onDragStart,
      onDragEnd: onDragEnd ?? oldMarker.onDragEnd,
      consumeTapEvents: onTap != null ? true : oldMarker.consumeTapEvents,
      onTap: onTap ?? oldMarker.onTap,
    );
    markers.add(updatedMarker);
  }
}

mixin PolylineManager on MarkerManager {
  Color defaultColor = Colors.black;
  Set<Polyline> polylines = <Polyline>{};
  void addPolylineToLocation({
    required List<LatLng> points,
    required String polylineId,
    JointType jointType = JointType.mitered,
    Color? color,
    int? width,
    bool? visible,
    int zIndex = 0,
    VoidCallback? onTap,
  }) {
    final Polyline polyline = Polyline(
      polylineId: PolylineId(polylineId),
      points: points,
      color: color ?? defaultColor,
      width: width ?? 10,
      consumeTapEvents: onTap != null ? true : false,
      visible: visible ?? true,
      zIndex: zIndex,
      onTap: onTap,
      jointType: jointType,
    );
    polylines.add(polyline);
  }

  void removePolyline(String polylineId) {
    polylines
        .removeWhere((polyline) => polyline.polylineId.value == polylineId);
  }

  void updatePolyline({
    required String polylineId,
    List<LatLng>? points,
    JointType jointType = JointType.mitered,
    Color? color,
    int? width,
    bool? consumeTapEvents,
    bool? visible,
    int zIndex = 0,
    VoidCallback? onTap,
  }) {
    final Polyline oldPolyline = polylines.firstWhere(
      (polyline) => polyline.polylineId.value == polylineId,
      orElse: () => throw Exception('Polyline not found'),
    );
    removePolyline(polylineId);
    final Polyline updatedPolyline = Polyline(
      polylineId: PolylineId(polylineId),
      points: points ?? oldPolyline.points,
      color: color ?? oldPolyline.color,
      width: width ?? oldPolyline.width,
      consumeTapEvents: onTap != null ? true : oldPolyline.consumeTapEvents,
      visible: visible ?? true,
      zIndex: zIndex,
      onTap: onTap ?? oldPolyline.onTap,
      jointType: jointType,
    );
    polylines.add(updatedPolyline);
  }
}

mixin CircleManager {
  Color defaultColor = Colors.black;
  Set<Circle> circles = <Circle>{};
  void addCircleToLocation({
    required LatLng latlng,
    required double radius,
    required String circleId,
    Color? fillColor,
    int? strokeWidth,
    Color? strokeColor,
    int zIndex = 0,
    bool? visible,
    VoidCallback? onTap,
  }) {
    final Circle circle = Circle(
      circleId: CircleId(circleId),
      center: latlng,
      radius: radius,
      strokeWidth: strokeWidth ?? 10,
      strokeColor: strokeColor ?? defaultColor,
      fillColor: fillColor ?? defaultColor,
      consumeTapEvents: onTap != null ? true : false,
      zIndex: zIndex,
      visible: visible ?? true,
      onTap: onTap,
    );
    circles.add(circle);
  }

  void removeCircle(String circleId) {
    circles.removeWhere((circle) => circle.circleId.value == circleId);
  }

  void updateCircle({
    required String circleId,
    LatLng? latlng,
    double? radius,
    Color? fillColor,
    int? strokeWidth,
    Color? strokeColor,
    int? zIndex,
    bool? visible,
    VoidCallback? onTap,
  }) {
    final Circle oldCircle = circles.firstWhere(
      (circle) => circle.circleId.value == circleId,
      orElse: () => throw Exception('Circle not found'),
    );
    removeCircle(circleId);
    final Circle updatedCircle = Circle(
      circleId: CircleId(circleId),
      center: latlng ?? oldCircle.center,
      radius: radius ?? oldCircle.radius,
      strokeWidth: strokeWidth ?? oldCircle.strokeWidth,
      strokeColor: strokeColor ?? oldCircle.strokeColor,
      fillColor: fillColor ?? oldCircle.fillColor,
      consumeTapEvents: onTap != null ? true : oldCircle.consumeTapEvents,
      zIndex: zIndex ?? oldCircle.zIndex,
      visible: visible ?? oldCircle.visible,
      onTap: onTap ?? oldCircle.onTap,
    );
    circles.add(updatedCircle);
  }
}

mixin PolygonManager {
  Color defaultColor = Colors.black;
  Set<Polygon> polygons = <Polygon>{};
  void addPolygonToLocation({
    required List<LatLng> points,
    required String polygonId,
    List<List<LatLng>>? holes,
    Color? strokeColor,
    int? strokeWidth,
    String? title,
    Color? fillColor,
    VoidCallback? onTap,
    int zIndex = 0,
    bool visible = true,
  }) {
    final Polygon polygon = Polygon(
      polygonId: PolygonId(polygonId),
      points: points,
      fillColor: fillColor ?? defaultColor,
      holes: holes ?? [],
      strokeColor: strokeColor ?? defaultColor,
      strokeWidth: strokeWidth ?? 10,
      consumeTapEvents: onTap != null ? true : false,
      visible: visible,
      onTap: onTap,
    );
    polygons.add(polygon);
  }

  void removePolygon(String polygonId) {
    polygons.removeWhere((polygon) => polygon.polygonId.value == polygonId);
  }

  void updatePolygon({
    required String polygonId,
    List<LatLng>? points,
    List<List<LatLng>>? holes,
    Color? fillColor,
    Color? strokeColor,
    int? strokeWidth,
    bool? visible,
    int? zIndex,
    VoidCallback? onTap,
  }) {
    final Polygon oldPolygon = polygons.firstWhere(
      (polygon) => polygon.polygonId.value == polygonId,
      orElse: () => throw Exception('Polygon not found'),
    );
    removePolygon(polygonId);
    final Polygon updatedPolygon = Polygon(
      polygonId: PolygonId(polygonId),
      points: points ?? oldPolygon.points,
      fillColor: fillColor ?? oldPolygon.fillColor,
      strokeColor: strokeColor ?? oldPolygon.strokeColor,
      strokeWidth: strokeWidth ?? oldPolygon.strokeWidth,
      holes: holes ?? oldPolygon.holes,
      visible: visible ?? oldPolygon.visible,
      zIndex: zIndex ?? oldPolygon.zIndex,
      consumeTapEvents: onTap != null ? true : oldPolygon.consumeTapEvents,
      onTap: onTap ?? oldPolygon.onTap,
    );
    polygons.add(updatedPolygon);
  }
}
