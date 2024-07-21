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

class ListPage extends ConsumerWidget {
  const ListPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final List<GeoInfo> points = ref.watch(geoInfoListProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(points[index].placemark.street!),
            subtitle: Text("訪問回数: ${points[index].visit_count.toString()}"),
            onTap: () {
              points[index] = points[index].copyWith(
                visit_count: points[index].visit_count + 1,
              );
              ref.read(geoInfoListProvider.notifier).updateGeoInfo(
                    points[index],
                    points[index],
                  );
            },
          );
        },
      ),
    );
  }
}
