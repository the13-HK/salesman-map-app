// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoInfo _$GeoInfoFromJson(Map<String, dynamic> json) {
  return _GeoInfo.fromJson(json);
}

/// @nodoc
mixin _$GeoInfo {
  Marker get marker => throw _privateConstructorUsedError;
  Placemark get placemark => throw _privateConstructorUsedError;
  int get visit_count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoInfoCopyWith<GeoInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoInfoCopyWith<$Res> {
  factory $GeoInfoCopyWith(GeoInfo value, $Res Function(GeoInfo) then) =
      _$GeoInfoCopyWithImpl<$Res, GeoInfo>;
  @useResult
  $Res call({Marker marker, Placemark placemark, int visit_count});
}

/// @nodoc
class _$GeoInfoCopyWithImpl<$Res, $Val extends GeoInfo>
    implements $GeoInfoCopyWith<$Res> {
  _$GeoInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
    Object? placemark = null,
    Object? visit_count = null,
  }) {
    return _then(_value.copyWith(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      placemark: null == placemark
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark,
      visit_count: null == visit_count
          ? _value.visit_count
          : visit_count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoInfoCopyWith<$Res> implements $GeoInfoCopyWith<$Res> {
  factory _$$_GeoInfoCopyWith(
          _$_GeoInfo value, $Res Function(_$_GeoInfo) then) =
      __$$_GeoInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Marker marker, Placemark placemark, int visit_count});
}

/// @nodoc
class __$$_GeoInfoCopyWithImpl<$Res>
    extends _$GeoInfoCopyWithImpl<$Res, _$_GeoInfo>
    implements _$$_GeoInfoCopyWith<$Res> {
  __$$_GeoInfoCopyWithImpl(_$_GeoInfo _value, $Res Function(_$_GeoInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
    Object? placemark = null,
    Object? visit_count = null,
  }) {
    return _then(_$_GeoInfo(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      placemark: null == placemark
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark,
      visit_count: null == visit_count
          ? _value.visit_count
          : visit_count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@MarkerConverter()
@PlacemarkConverter()
class _$_GeoInfo implements _GeoInfo {
  const _$_GeoInfo(
      {required this.marker,
      required this.placemark,
      required this.visit_count});

  factory _$_GeoInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GeoInfoFromJson(json);

  @override
  final Marker marker;
  @override
  final Placemark placemark;
  @override
  final int visit_count;

  @override
  String toString() {
    return 'GeoInfo(marker: $marker, placemark: $placemark, visit_count: $visit_count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoInfo &&
            (identical(other.marker, marker) || other.marker == marker) &&
            (identical(other.placemark, placemark) ||
                other.placemark == placemark) &&
            (identical(other.visit_count, visit_count) ||
                other.visit_count == visit_count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, marker, placemark, visit_count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoInfoCopyWith<_$_GeoInfo> get copyWith =>
      __$$_GeoInfoCopyWithImpl<_$_GeoInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoInfoToJson(
      this,
    );
  }
}

abstract class _GeoInfo implements GeoInfo {
  const factory _GeoInfo(
      {required final Marker marker,
      required final Placemark placemark,
      required final int visit_count}) = _$_GeoInfo;

  factory _GeoInfo.fromJson(Map<String, dynamic> json) = _$_GeoInfo.fromJson;

  @override
  Marker get marker;
  @override
  Placemark get placemark;
  @override
  int get visit_count;
  @override
  @JsonKey(ignore: true)
  _$$_GeoInfoCopyWith<_$_GeoInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
