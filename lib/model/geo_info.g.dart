// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoInfo _$$_GeoInfoFromJson(Map<String, dynamic> json) => _$_GeoInfo(
      marker: const MarkerConverter()
          .fromJson(json['marker'] as Map<String, dynamic>),
      placemark: const PlacemarkConverter()
          .fromJson(json['placemark'] as Map<String, dynamic>),
      visit_count: json['visit_count'] as int,
    );

Map<String, dynamic> _$$_GeoInfoToJson(_$_GeoInfo instance) =>
    <String, dynamic>{
      'marker': const MarkerConverter().toJson(instance.marker),
      'placemark': const PlacemarkConverter().toJson(instance.placemark),
      'visit_count': instance.visit_count,
    };
