import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final String boxName = 'favourite_list';

class SavedItemsPage extends StatefulWidget {
  @override
  _SavedItemsPageState createState() => _SavedItemsPageState();
}

class _SavedItemsPageState extends State<SavedItemsPage> {
  List<String> favouriteList;

  @override
  void initState() {
    super.initState();
    var box = Hive.box<String>(boxName);
    setState(() {
      favouriteList = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved"),
      ),
      body: ListView.builder(
        itemBuilder: (_cc, index) {
          return ListTile(
            title: Text(favouriteList[index]),
          );
        },
        itemCount: favouriteList.length,
      ),
    );
  }
}
