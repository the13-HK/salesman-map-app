import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/geo_info.dart';
import './main.dart';

class ListDetailPage extends ConsumerWidget {
  const ListDetailPage({super.key, required this.index});
  final int index; //上位Widgetから受け取りたいデータ

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<GeoInfo> points = ref.watch(geoInfoListProvider);
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    String inputText = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細画面'),
      ),
      body: Center(
        // child: Text(info.toJson().toString()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 住所情報の表示/
            SizedBox(
              width: deviceWidth,
              height: deviceHeight * 0.2,
              child: ListTile(
                title: const Text('住所情報'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index != -1
                        ? Text('郵便番号: ${points[index].placemark.postalCode}')
                        : const Text('郵便番号: '),
                    index != -1
                        ? Text(
                            '都道府県: ${points[index].placemark.administrativeArea}')
                        : const Text('都道府県: '),
                    index != -1
                        ? Text('市区町村1: ${points[index].placemark.locality}')
                        : const Text('市区町村1: '),
                    index != -1
                        ? Text('市区町村2: ${points[index].placemark.subLocality}')
                        : const Text('市区町村2: '),
                    index != -1
                        ? Text('住所: ${points[index].placemark.street}')
                        : const Text('住所: '),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Text("訪問履歴"),
            ),
            // 訪問履歴の表示
            SizedBox(
              width: deviceWidth,
              height: deviceHeight * 0.3,
              child: ListView.builder(
                itemCount: index != -1 ? points[index].visitHistory.length : 0,
                itemBuilder: (context, historyIndex) {
                  return ListTile(
                    title: Text(
                      points[index].visitHistory[historyIndex].toString(),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit_note),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextField(
                                  controller: TextEditingController(
                                      text: points[index]
                                          .visitMemoList[historyIndex]),
                                  onChanged: (value) {
                                    inputText = value;
                                  },
                                  decoration:
                                      const InputDecoration(hintText: "ここに入力"),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('キャンセル'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      final mutableList = List<String>.from(
                                          points[index].visitMemoList);
                                      final newList = mutableList
                                          .asMap()
                                          .entries
                                          .map((count) {
                                        return count.key == historyIndex
                                            ? inputText
                                            : count.value;
                                      }).toList();
                                      points[index] = points[index].copyWith(
                                        visitMemoList: newList,
                                      );
                                      //OKを押したあとの処理
                                      ref
                                          .read(geoInfoListProvider.notifier)
                                          .updateGeoInfo(
                                            points[index],
                                            points[index],
                                          );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
              child: Text("不在履歴"),
            ),
            SizedBox(
              width: deviceWidth,
              height: deviceHeight * 0.3,
              child: ListView.builder(
                itemCount:
                    index != -1 ? points[index].absenceHistory.length : 0,
                itemBuilder: (context, absenceIndex) {
                  return ListTile(
                    title: Text(
                      points[index].absenceHistory[absenceIndex].toString(),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit_note),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextField(
                                  controller: TextEditingController(
                                      text: points[index]
                                          .absenceMemoList[absenceIndex]),
                                  decoration:
                                      const InputDecoration(hintText: "ここに入力"),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('キャンセル'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      //OKを押したあとの処理
                                      final mutableList = List<String>.from(
                                          points[index].absenceMemoList);
                                      final newList = mutableList
                                          .asMap()
                                          .entries
                                          .map((count) {
                                        return count.key == absenceIndex
                                            ? inputText
                                            : count.value;
                                      }).toList();
                                      points[index] = points[index].copyWith(
                                        absenceMemoList: newList,
                                      );
                                      //OKを押したあとの処理
                                      ref
                                          .read(geoInfoListProvider.notifier)
                                          .updateGeoInfo(
                                            points[index],
                                            points[index],
                                          );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
