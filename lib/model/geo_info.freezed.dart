// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeoInfo _$GeoInfoFromJson(Map<String, dynamic> json) {
  return _GeoInfo.fromJson(json);
}

/// @nodoc
mixin _$GeoInfo {
  Marker get marker => throw _privateConstructorUsedError;
  Placemark get placemark => throw _privateConstructorUsedError;
  List<DateTime> get visitHistory => throw _privateConstructorUsedError;
  List<DateTime> get absenceHistory => throw _privateConstructorUsedError;
  List<String> get visitMemoList => throw _privateConstructorUsedError;
  List<String> get absenceMemoList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoInfoCopyWith<GeoInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoInfoCopyWith<$Res> {
  factory $GeoInfoCopyWith(GeoInfo value, $Res Function(GeoInfo) then) =
      _$GeoInfoCopyWithImpl<$Res, GeoInfo>;
  @useResult
  $Res call(
      {Marker marker,
      Placemark placemark,
      List<DateTime> visitHistory,
      List<DateTime> absenceHistory,
      List<String> visitMemoList,
      List<String> absenceMemoList});
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
    Object? visitHistory = null,
    Object? absenceHistory = null,
    Object? visitMemoList = null,
    Object? absenceMemoList = null,
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
      visitHistory: null == visitHistory
          ? _value.visitHistory
          : visitHistory // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      absenceHistory: null == absenceHistory
          ? _value.absenceHistory
          : absenceHistory // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      visitMemoList: null == visitMemoList
          ? _value.visitMemoList
          : visitMemoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      absenceMemoList: null == absenceMemoList
          ? _value.absenceMemoList
          : absenceMemoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoInfoImplCopyWith<$Res> implements $GeoInfoCopyWith<$Res> {
  factory _$$GeoInfoImplCopyWith(
          _$GeoInfoImpl value, $Res Function(_$GeoInfoImpl) then) =
      __$$GeoInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Marker marker,
      Placemark placemark,
      List<DateTime> visitHistory,
      List<DateTime> absenceHistory,
      List<String> visitMemoList,
      List<String> absenceMemoList});
}

/// @nodoc
class __$$GeoInfoImplCopyWithImpl<$Res>
    extends _$GeoInfoCopyWithImpl<$Res, _$GeoInfoImpl>
    implements _$$GeoInfoImplCopyWith<$Res> {
  __$$GeoInfoImplCopyWithImpl(
      _$GeoInfoImpl _value, $Res Function(_$GeoInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
    Object? placemark = null,
    Object? visitHistory = null,
    Object? absenceHistory = null,
    Object? visitMemoList = null,
    Object? absenceMemoList = null,
  }) {
    return _then(_$GeoInfoImpl(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      placemark: null == placemark
          ? _value.placemark
          : placemark // ignore: cast_nullable_to_non_nullable
              as Placemark,
      visitHistory: null == visitHistory
          ? _value._visitHistory
          : visitHistory // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      absenceHistory: null == absenceHistory
          ? _value._absenceHistory
          : absenceHistory // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      visitMemoList: null == visitMemoList
          ? _value._visitMemoList
          : visitMemoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      absenceMemoList: null == absenceMemoList
          ? _value._absenceMemoList
          : absenceMemoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@MarkerConverter()
@PlacemarkConverter()
class _$GeoInfoImpl implements _GeoInfo {
  const _$GeoInfoImpl(
      {required this.marker,
      required this.placemark,
      required final List<DateTime> visitHistory,
      required final List<DateTime> absenceHistory,
      required final List<String> visitMemoList,
      required final List<String> absenceMemoList})
      : _visitHistory = visitHistory,
        _absenceHistory = absenceHistory,
        _visitMemoList = visitMemoList,
        _absenceMemoList = absenceMemoList;

  factory _$GeoInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoInfoImplFromJson(json);

  @override
  final Marker marker;
  @override
  final Placemark placemark;
  final List<DateTime> _visitHistory;
  @override
  List<DateTime> get visitHistory {
    if (_visitHistory is EqualUnmodifiableListView) return _visitHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitHistory);
  }

  final List<DateTime> _absenceHistory;
  @override
  List<DateTime> get absenceHistory {
    if (_absenceHistory is EqualUnmodifiableListView) return _absenceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absenceHistory);
  }

  final List<String> _visitMemoList;
  @override
  List<String> get visitMemoList {
    if (_visitMemoList is EqualUnmodifiableListView) return _visitMemoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitMemoList);
  }

  final List<String> _absenceMemoList;
  @override
  List<String> get absenceMemoList {
    if (_absenceMemoList is EqualUnmodifiableListView) return _absenceMemoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absenceMemoList);
  }

  @override
  String toString() {
    return 'GeoInfo(marker: $marker, placemark: $placemark, visitHistory: $visitHistory, absenceHistory: $absenceHistory, visitMemoList: $visitMemoList, absenceMemoList: $absenceMemoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoInfoImpl &&
            (identical(other.marker, marker) || other.marker == marker) &&
            (identical(other.placemark, placemark) ||
                other.placemark == placemark) &&
            const DeepCollectionEquality()
                .equals(other._visitHistory, _visitHistory) &&
            const DeepCollectionEquality()
                .equals(other._absenceHistory, _absenceHistory) &&
            const DeepCollectionEquality()
                .equals(other._visitMemoList, _visitMemoList) &&
            const DeepCollectionEquality()
                .equals(other._absenceMemoList, _absenceMemoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      marker,
      placemark,
      const DeepCollectionEquality().hash(_visitHistory),
      const DeepCollectionEquality().hash(_absenceHistory),
      const DeepCollectionEquality().hash(_visitMemoList),
      const DeepCollectionEquality().hash(_absenceMemoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoInfoImplCopyWith<_$GeoInfoImpl> get copyWith =>
      __$$GeoInfoImplCopyWithImpl<_$GeoInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoInfoImplToJson(
      this,
    );
  }
}

abstract class _GeoInfo implements GeoInfo {
  const factory _GeoInfo(
      {required final Marker marker,
      required final Placemark placemark,
      required final List<DateTime> visitHistory,
      required final List<DateTime> absenceHistory,
      required final List<String> visitMemoList,
      required final List<String> absenceMemoList}) = _$GeoInfoImpl;

  factory _GeoInfo.fromJson(Map<String, dynamic> json) = _$GeoInfoImpl.fromJson;

  @override
  Marker get marker;
  @override
  Placemark get placemark;
  @override
  List<DateTime> get visitHistory;
  @override
  List<DateTime> get absenceHistory;
  @override
  List<String> get visitMemoList;
  @override
  List<String> get absenceMemoList;
  @override
  @JsonKey(ignore: true)
  _$$GeoInfoImplCopyWith<_$GeoInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
