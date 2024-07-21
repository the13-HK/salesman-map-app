import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './main_page.dart';
import './list_page.dart';
import './model/geo_info.dart';
import './model/geo_info_provider.dart';

final geoInfoListProvider =
    StateNotifierProvider<GeoInfoListNotifier, List<GeoInfo>>((ref) {
  return GeoInfoListNotifier();
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
          body: const TabBarView(
            children: <Widget>[
              MainPage(title: 'Flutter Demo Home Page'),
              ListPage(title: 'Flutter Demo Home Page'),
            ],
          ),
        ),
      ),
    );
  }
}
