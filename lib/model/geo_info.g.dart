// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoInfoImpl _$$GeoInfoImplFromJson(Map<String, dynamic> json) =>
    _$GeoInfoImpl(
      marker: const MarkerConverter()
          .fromJson(json['marker'] as Map<String, dynamic>),
      placemark: const PlacemarkConverter()
          .fromJson(json['placemark'] as Map<String, dynamic>),
      visitHistory: (json['visitHistory'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      absenceHistory: (json['absenceHistory'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      visitMemoList: (json['visitMemoList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      absenceMemoList: (json['absenceMemoList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$GeoInfoImplToJson(_$GeoInfoImpl instance) =>
    <String, dynamic>{
      'marker': const MarkerConverter().toJson(instance.marker),
      'placemark': const PlacemarkConverter().toJson(instance.placemark),
      'visitHistory':
          instance.visitHistory.map((e) => e.toIso8601String()).toList(),
      'absenceHistory':
          instance.absenceHistory.map((e) => e.toIso8601String()).toList(),
      'visitMemoList': instance.visitMemoList,
      'absenceMemoList': instance.absenceMemoList,
    };
