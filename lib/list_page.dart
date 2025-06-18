import 'package:logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './model/geo_info.dart';
import './main.dart';
import './list_detail_page.dart';

final logger = Logger('MyLogger');

class ListPage extends ConsumerWidget {
  const ListPage({super.key, required this.points});
  final List<GeoInfo> points;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: deviceWidth * 0.7,
                height: deviceHeight * 0.1,
                child: ListTile(
                  title: Text(
                      "${points[index].placemark.locality} ${points[index].placemark.subLocality} ${points[index].placemark.thoroughfare}"),
                  subtitle: Row(
                    children: <Widget>[
                      Text("訪問回数: ${points[index].visitHistory.length}"),
                      Text("不在回数: ${points[index].absenceHistory.length}"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.1,
                height: deviceHeight * 0.1,
                child: IconButton(
                  icon: const Icon(Icons.meeting_room),
                  onPressed: () {
                    points[index] = points[index].copyWith(
                      visitHistory: [
                        ...points[index].visitHistory,
                        DateTime.now()
                      ],
                      visitMemoList: [
                        ...points[index].visitMemoList,
                        '',
                      ],
                    );
                    ref.read(geoInfoListProvider.notifier).updateGeoInfo(
                          points[index],
                          points[index],
                        );
                  },
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.1,
                height: deviceHeight * 0.1,
                child: IconButton(
                  icon: const Icon(Icons.no_meeting_room),
                  onPressed: () {
                    points[index] = points[index].copyWith(
                      absenceHistory: [
                        ...points[index].absenceHistory,
                        DateTime.now()
                      ],
                      absenceMemoList: [
                        ...points[index].absenceMemoList,
                        '',
                      ],
                    );
                    ref.read(geoInfoListProvider.notifier).updateGeoInfo(
                          points[index],
                          points[index],
                        );
                  },
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.1,
                height: deviceHeight * 0.1,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (context) => ListDetailPage(index: index),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
