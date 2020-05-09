import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'saved_list_page.dart';

final String boxName = 'favourite_list';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  List<String> images = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<String> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>(boxName);
  }

  void favouritePressed(id) {
    if (box.containsKey(id)) {
      box.delete(id);
    } else {
      box.put(id, id);
    }
  }

  Widget _getIcon(id) {
    bool isFavourite = box.containsKey(id);
    return Icon(
      isFavourite ? Icons.favorite : Icons.favorite_border,
      color: isFavourite ? Colors.red : Colors.grey,
    );
  }

  Widget _listItemBuilder(_context, index) {
    String id = widget.images[index];
    return ListTile(
      title: Text(id),
      trailing: GestureDetector(
        onTap: () {
          favouritePressed(id);
        },
        child: _getIcon(id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive DB Saved List Sample"),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (_, __, ___) {
          return ListView.builder(
            itemCount: widget.images.length,
            itemBuilder: _listItemBuilder,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          'Saved List',
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SavedItemsPage()));
        },
      ),
    );
  }
}
