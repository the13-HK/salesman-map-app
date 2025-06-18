import 'package:geocoding/geocoding.dart';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import './model/geo_info.dart';
import './list_detail_page.dart';
import './main.dart';

final logger = Logger('MyLogger');

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key, required this.points});
  final List<GeoInfo> points;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  LatLng? _currentPosition;

  /// 現在地を取得してカメラ位置を更新する処理
  Future<void> _getCurrentLocation() async {
    // 位置情報サービスが有効かチェック
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // 位置情報の権限を確認
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 権限リクエスト
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    // 現在地を取得
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Current position: ${position.latitude}, ${position.longitude}');
    print('points: ${widget.points}');

    // 現在地の位置情報を更新し、マーカーとして追加（色を青に設定）
    // setState(() {
    //   _currentPosition = LatLng(position.latitude, position.longitude);
    // });
  }

  @override
  Widget build(BuildContext context) {
    double _latitude = 35.681236;
    double _longitude = 139.767125;
    Future<LatLng> forcusPoint = _getCurrentLocation().then((value) {
      return LatLng(_latitude, _longitude);
    });
    List<GeoInfo> points = widget.points;
    return SlidingUpPanel(
      body: //_latitude != null && _longitude != null
          FlutterMap(
        options: MapOptions(
          center: _currentPosition ?? LatLng(_latitude, _longitude),
          zoom: 10.0,
          interactiveFlags: InteractiveFlag.all,
          enableScrollWheel: true,
          scrollWheelVelocity: 0.00001,
          onLongPress: (tapPosition, point) {
            _addMarker(point, points, context);
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.openstreetmap.jp/styles/maptiler-basic-ja/512/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(_latitude, _longitude),
                builder: (ctx) => const Icon(
                  Icons.navigation_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          MarkerLayer(
            markers: points.map((e) => e.marker).toList(),
          )
        ],
      ),
      panel: (points.isNotEmpty && points != -1)
          ? ListDetailPage(
              index: points.indexWhere(
                  (point) => point.marker.point == forcusPoint, 0))
          : const Center(),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      minHeight: 0.5,
      maxHeight: MediaQuery.of(context).size.height * 0.5,
    );
  }

  void _addMarker(
      LatLng latlng, List<GeoInfo> points, BuildContext context) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        latlng.latitude, latlng.longitude,
        localeIdentifier: "JP");

    // _setFocusPoint(LatLng point) {
    //   setState(() {
    //     LatLng forcusPoint = point;
    //   });
    // }

    setState(() {
      points.add(
        GeoInfo(
          marker: Marker(
            width: 30.0,
            height: 30.0,
            point: latlng,
            builder: (ctx) => GestureDetector(
              // onLongPress: _removeMarker(latlng, points),
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Navigator(
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => ListDetailPage(
                            index: points.indexWhere(
                                (element) => element.marker.point == latlng, 0),
                          ),
                          settings: settings,
                        ),
                      )),
              child: const Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 24,
              ),
            ),
            rotate: true,
          ),
          placemark: placemarks[1],
          visitHistory: [],
          absenceHistory: [],
          visitMemoList: [],
          absenceMemoList: [],
        ),
      );
    });
  }

  _removeMarker(LatLng latlng, List<GeoInfo> points) async {
    setState(() {
      points.removeWhere((element) => element.marker.point == latlng);
    });
  }
}

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     super.initState();
//   }
// }
