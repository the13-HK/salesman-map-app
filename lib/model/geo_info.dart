import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

// 生成されるdartファイルを記述
part 'geo_info.freezed.dart';
part 'geo_info.g.dart';

@freezed
class GeoInfo with _$GeoInfo {
  @MarkerConverter()
  @PlacemarkConverter()
  const factory GeoInfo({
    required Marker marker,
    required Placemark placemark,
    required int visit_count,
  }) = _GeoInfo;

  factory GeoInfo.fromJson(Map<String, dynamic> json) =>
      _$GeoInfoFromJson(json);
}

class MarkerConverter implements JsonConverter<Marker, Map<String, dynamic>> {
  const MarkerConverter();

  @override
  Marker fromJson(Map<String, dynamic> json) {
    // JSONからMarkerオブジェクトを作成するロジック
    return Marker(
      point: LatLng(json['point']['latitude'], json['point']['longitude']),
      builder: (context) => const Icon(Icons.location_on),
    ); // ここに適切な変換ロジックを追加
  }

  @override
  Map<String, dynamic> toJson(Marker marker) {
    // MarkerオブジェクトからJSONに変換するロジック
    return markerToJson(marker); // ここに適切な変換ロジックを追加
  }

  Map<String, dynamic> markerToJson(Marker marker) {
    return {
      'latitude': marker.point.latitude,
      'longitude': marker.point.longitude,
      // 他にもMarkerに関連するプロパティがあればここに追加
    };
  }
}

class PlacemarkConverter
    implements JsonConverter<Placemark, Map<String, dynamic>> {
  const PlacemarkConverter();

  @override
  Placemark fromJson(Map<String, dynamic> json) {
    // JSONからMarkerオブジェクトを作成するロジック
    return Placemark(
      name: json['name'],
      street: json['street'],
      isoCountryCode: json['isoCountryCode'],
      country: json['country'],
      postalCode: json['postalCode'],
      administrativeArea: json['administrativeArea'],
      subAdministrativeArea: json['subAdministrativeArea'],
      locality: json['locality'],
      subLocality: json['subLocality'],
      thoroughfare: json['thoroughfare'],
    ); // ここに適切な変換ロジックを追加
  }

  @override
  Map<String, dynamic> toJson(Placemark placemark) {
    // MarkerオブジェクトからJSONに変換するロジック
    return placemarkToJson(placemark); // ここに適切な変換ロジックを追加
  }

  Map<String, dynamic> placemarkToJson(Placemark placemark) {
    return {
      'name': placemark.name,
      'street': placemark.street,
      'isoCountryCode': placemark.isoCountryCode,
      'country': placemark.country,
      'postalCode': placemark.postalCode,
      'administrativeArea': placemark.administrativeArea,
      'subAdministrativeArea': placemark.subAdministrativeArea,
      'locality': placemark.locality,
      'subLocality': placemark.subLocality,
      'thoroughfare': placemark.thoroughfare,
      // 他にもPlacemarkに関連するプロパティがあればここに追加
    };
  }
}
