import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 15.0,
  );
  GoogleMapController? mapController;
  final TextEditingController locationSearchController =
      TextEditingController();
  Set<Marker> markers = <Marker>{};
  Set<Polygon> polygons = <Polygon>{};
  Set<Polyline> polylines = <Polyline>{};
  Set<Circle> circles = <Circle>{};

  Future<void> onMapCreated(GoogleMapController controller) async {
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
      zoom: zoom ?? 15.0,
    );
    await mapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  Marker addMarkerToLocation({
    required LatLng latlng,
    required String markerId,
    String? title,
    BitmapDescriptor? icon,
  }) {
    final Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: latlng,
      infoWindow: InfoWindow(
        title: title,
      ),
      icon: icon ?? BitmapDescriptor.defaultMarker,
    );
    markers.add(marker);
    return marker;
  }

  Future<Polygon> addPolygonToLocation({
    required List<LatLng> points,
    required String polygonId,
    List<List<LatLng>>? holes,
    String? title,
    Color? fillColor,
  }) async {
    final Polygon polygon = Polygon(
      polygonId: PolygonId(polygonId),
      points: points,
      fillColor: fillColor ?? Colors.black,
      holes: holes ?? [],
    );
    polygons.add(polygon);
    return polygon;
  }

  Polyline addPolylineToLocation({
    required List<LatLng> points,
    required String polylineId,
    Color? color,
    int? width,
  }) {
    final Polyline polyline = Polyline(
      polylineId: PolylineId(polylineId),
      points: points,
      color: color ?? Colors.black,
      width: width ?? 10,
    );
    polylines.add(polyline);
    return polyline;
  }

  Circle addCircleToLocation({
    required LatLng latlng,
    required double radius,
    required String circleId,
    Color? fillColor,
    int? strokeWidth,
    Color? strokeColor,
  }) {
    final Circle circle = Circle(
      circleId: CircleId(circleId),
      center: latlng,
      radius: radius,
      strokeWidth: strokeWidth ?? 10,
      strokeColor: strokeColor ?? Colors.black,
      fillColor: fillColor ?? Colors.black,
    );
    circles.add(circle);
    return circle;
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
        northeast: LatLng(northEastLatitude, northEastLongitude));
  }
}
