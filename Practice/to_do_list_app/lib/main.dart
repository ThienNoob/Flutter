import 'package:flutter/material.dart';
import 'package:to_do_list_app/Item/data_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Widget/card_widget.dart';
import 'Widget/modal_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Data_Item> items = [];
  void _addToSP() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'items';
    final value = items;
    prefs.setStringList(key, value.cast<String>());
    print('saved $value');
  }



  void _addTask(String task) {
    final newItem = Data_Item(id: DateTime.now().toString(), name: task);
    print(newItem.name);
    setState(() {
      items.add(newItem);
    });
  }

  void _removeTask(String id) {
    setState(() {
      items.removeWhere((element) => element.id == id);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              'TO DO LIST',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: items
                .map((item) => CardWidget(index: items.indexOf(item),item: item, removeTask: _removeTask))
                .toList(),
            // children: [
            //   CardWidget(),
            //   CardWidget(),
            //   CardWidget()
            // ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context, // Use context here
              builder: (BuildContext context) {
                // Correct argument name
                return ModalButton(
                  addTask: _addTask,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
