import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import './geo_info.dart';

class GeoInfoListNotifier extends StateNotifier<List<GeoInfo>> {
  GeoInfoListNotifier() : super([]);

  // GeoInfo をリストに追加
  void addGeoInfo(GeoInfo geoInfo) {
    state = [...state, geoInfo];
  }

  // GeoInfo をリストから削除
  void removeGeoInfo(GeoInfo geoInfo) {
    state = state.where((item) => item != geoInfo).toList();
  }

  // GeoInfo を更新
  void updateGeoInfo(GeoInfo oldGeoInfo, GeoInfo newGeoInfo) {
    state =
        state.map((item) => item == oldGeoInfo ? newGeoInfo : item).toList();
  }

  // 特定の GeoInfo を取得（例：indexによるアクセス）
  GeoInfo getGeoInfoAt(int index) {
    return state[index];
  }

  // GeoInfo のリストをクリア
  void clearGeoInfoList() {
    state = [];
  }

  // その他の操作（例：特定条件でフィルタ、ソートなど）

// 既定の GeoInfo オブジェクトの生成
  GeoInfo createDefaultGeoInfo() {
    return GeoInfo(
      marker: Marker(
        point: LatLng(0.0, 0.0), // 仮のデフォルト位置
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
      visit_count: 0,
    );
  }

  GeoInfo? findGeoInfoByCoordinates(double latitude, double longitude) {
    // 指定された緯度と経度に最も近い GeoInfo を検索
    return state.firstWhere(
        (geoInfo) =>
            geoInfo.marker.point.latitude == latitude &&
            geoInfo.marker.point.longitude == longitude,
        orElse: () => createDefaultGeoInfo());
  }
}
