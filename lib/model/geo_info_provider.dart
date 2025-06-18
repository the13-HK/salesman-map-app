import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import './geo_info.dart';

class GeoInfoListNotifier extends StateNotifier<List<GeoInfo>> {
  GeoInfoListNotifier()
      : super([
          // GeoInfo(
          //   marker: Marker(
          //     point: LatLng(0.0, 0.0), // ????f?t?H???g??u
          //     builder: (context) => const Icon(Icons.location_off),
          //   ),
          //   placemark: const Placemark(
          //     name: 'Unknown',
          //     street: 'None',
          //     isoCountryCode: 'None',
          //     country: 'Unknown',
          //     postalCode: '00000',
          //     administrativeArea: 'Unknown',
          //     subAdministrativeArea: 'Unknown',
          //     locality: 'Unknown',
          //     subLocality: 'Unknown',
          //     thoroughfare: 'Unknown',
          //   ),
          //   visitHistory: [],
          //   absenceHistory: [],
          //   visitMemoList: [],
          //   absenceMemoList: [],
          // )
        ]);

  List<GeoInfo> loadGeoInfoList() {
    // ?w??????x??o?x??????? GeoInfo ??????
    final List<GeoInfo> geoInfoList = [createDefaultGeoInfo()];
    state = geoInfoList;
    return geoInfoList;
  }

  // GeoInfo ?????X?g????
  void addGeoInfo(GeoInfo geoInfo) {
    state = [...state, geoInfo];
  }

  // GeoInfo
  void removeGeoInfo(GeoInfo geoInfo) {
    state = state.where((item) => item != geoInfo).toList();
  }

  // GeoInfo
  void updateGeoInfo(GeoInfo oldGeoInfo, GeoInfo newGeoInfo) {
    state =
        state.map((item) => item == oldGeoInfo ? newGeoInfo : item).toList();
  }

  //
  GeoInfo getGeoInfoAt(int index) {
    return state[index];
  }

  // GeoInfo ????X?g???N???A
  void clearGeoInfoList() {
    state = [];
  }

  // ??????????i??F?????????t?B???^?A?\?[?g???j

// ????? GeoInfo ?I?u?W?F?N?g?????
  GeoInfo createDefaultGeoInfo() {
    return GeoInfo(
      marker: Marker(
        point: LatLng(0.0, 0.0), // ????f?t?H???g??u
        builder: (context) => const Icon(Icons.location_off),
      ),
      placemark: const Placemark(
        name: 'Unknown',
        street: 'None',
        isoCountryCode: 'None',
        country: 'Unknown',
        postalCode: '00000',
        administrativeArea: 'Unknown',
        subAdministrativeArea: 'Unknown',
        locality: 'Unknown',
        subLocality: 'Unknown',
        thoroughfare: 'Unknown',
      ),
      visitHistory: [],
      absenceHistory: [],
      visitMemoList: [],
      absenceMemoList: [],
    );
  }

  GeoInfo? findGeoInfoByCoordinates(double latitude, double longitude) {
    // ?w??????x??o?x??????? GeoInfo ??????
    return state.firstWhere(
        (geoInfo) =>
            geoInfo.marker.point.latitude == latitude &&
            geoInfo.marker.point.longitude == longitude,
        orElse: () => createDefaultGeoInfo());
  }
}
