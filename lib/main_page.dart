import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './model/geo_info.dart';
import './main.dart';

final logger = Logger('MyLogger');

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double _latitude = 35.681236;
    double _longitude = 139.767125;
    final List<GeoInfo> points = ref.watch(geoInfoListProvider);

    return Scaffold(
        body: //_latitude != null && _longitude != null
            FlutterMap(
      options: MapOptions(
        center: LatLng(_latitude, _longitude),
        zoom: 10.0,
        interactiveFlags: InteractiveFlag.all,
        enableScrollWheel: true,
        scrollWheelVelocity: 0.00001,
        onTap: (tapPosition, point) {
          _addMarker(point, points, context);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.jp/{z}/{x}/{y}.png',
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
    )
        // : const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        );
  }

  void _addMarker(
      LatLng latlng, List<GeoInfo> points, BuildContext context) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latlng.latitude,
      latlng.longitude,
    );
    setState(() {
      points.add(
        GeoInfo(
          marker: Marker(
            width: 30.0,
            height: 30.0,
            point: latlng,
            builder: (ctx) => GestureDetector(
              onTap: () {
                showDialog(
                  context: ctx,
                  builder: (context) => AlertDialog(
                    title: const Text('ピンの位置'),
                    content: Text('情報: ${placemarks[1].toString()}'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('閉じる'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 24,
              ),
            ),
            rotate: true,
          ),
          placemark: placemarks[1],
          visit_count: 0,
        ),
      );
    });
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    logger.info('Latitude: ${position.latitude}');
    logger.info('Longitude: ${position.longitude}');
  }
}

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     super.initState();
//   }
// }
