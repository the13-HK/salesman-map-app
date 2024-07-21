import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import './geo_info.dart';

class GeoInfoListNotifier extends StateNotifier<List<GeoInfo>> {
  GeoInfoListNotifier() : super([]);

  // GeoInfo �����X�g�ɒǉ�
  void addGeoInfo(GeoInfo geoInfo) {
    state = [...state, geoInfo];
  }

  // GeoInfo �����X�g����폜
  void removeGeoInfo(GeoInfo geoInfo) {
    state = state.where((item) => item != geoInfo).toList();
  }

  // GeoInfo ���X�V
  void updateGeoInfo(GeoInfo oldGeoInfo, GeoInfo newGeoInfo) {
    state =
        state.map((item) => item == oldGeoInfo ? newGeoInfo : item).toList();
  }

  // ����� GeoInfo ���擾�i��Findex�ɂ��A�N�Z�X�j
  GeoInfo getGeoInfoAt(int index) {
    return state[index];
  }

  // GeoInfo �̃��X�g���N���A
  void clearGeoInfoList() {
    state = [];
  }

  // ���̑��̑���i��F��������Ńt�B���^�A�\�[�g�Ȃǁj

// ����� GeoInfo �I�u�W�F�N�g�̐���
  GeoInfo createDefaultGeoInfo() {
    return GeoInfo(
      marker: Marker(
        point: LatLng(0.0, 0.0), // ���̃f�t�H���g�ʒu
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
    // �w�肳�ꂽ�ܓx�ƌo�x�ɍł��߂� GeoInfo ������
    return state.firstWhere(
        (geoInfo) =>
            geoInfo.marker.point.latitude == latitude &&
            geoInfo.marker.point.longitude == longitude,
        orElse: () => createDefaultGeoInfo());
  }
}
