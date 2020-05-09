import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

final String boxName = 'favourite_list';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(boxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiveDB Saved List Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
