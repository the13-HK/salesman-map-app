import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import './main_page.dart';
import './list_page.dart';
import './model/geo_info.dart';
import './model/geo_info_provider.dart';

final geoInfoListProvider =
    StateNotifierProvider<GeoInfoListNotifier, List<GeoInfo>>((ref) {
  return GeoInfoListNotifier();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

// This widget is the root of your application.
class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    ref.read(geoInfoListProvider.notifier).addGeoInfo(
          GeoInfo(
            marker: Marker(
              point: LatLng(0.0, 0.0),
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
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final List<GeoInfo> points = ref.watch(geoInfoListProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.sawarabiMinchoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("地図アプリ"),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.map),
                  text: "地図",
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: "リスト",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MainPage(points: points),
              ListPage(points: points),
            ],
          ),
        ),
      ),
    );
  }
}
