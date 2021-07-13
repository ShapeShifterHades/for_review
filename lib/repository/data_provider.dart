import 'dart:async';

import 'package:for_review/models/item.dart';

class DataProvider {
  List<Item> items = <Item>[];

  final controller = StreamController<List<Item>>.broadcast();
  Stream<List<Item>> get controllerOut => controller.stream.asBroadcastStream();
  StreamSink<List<Item>> get controllerIn => controller.sink;

  void addNewItem(Item item) {
    items.insert(0, item);
    controllerIn.add(items);
  }

  void removeItem(int index) {
    items.removeAt(index);
    controllerIn.add(items);
  }

  void dispose() {
    controller.close();
  }

  void addInitialData(List<Item> initial) {
    items = initial;
    controllerIn.add(items);
  }
}
