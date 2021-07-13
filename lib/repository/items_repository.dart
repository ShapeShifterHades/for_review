import 'dart:math';

import 'package:for_review/constants.dart';
import 'package:for_review/models/item.dart';

import 'data_provider.dart';

class ItemsRepository {
  final DataProvider provider = DataProvider();
  final Random rng = Random();

  Stream<List<Item>> items() {
    return provider.controllerOut;
  }

  void addItem() {
    final Item item = Item.fromJson(kFakeData['data']![rng.nextInt(3)]);
    provider.addNewItem(item);
  }

  void deleteItem(int index) {
    provider.removeItem(index);
  }

  void addInitailData() {
    final List<Item> data = setUpInitialData();
    provider.addInitialData(data);
  }

  List<Item> setUpInitialData() {
    final int maxItems = rng.nextInt(90000) + 10000;
    return List<Item>.generate(
        maxItems, (i) => Item.fromJson(kFakeData['data']![rng.nextInt(3)]));
  }
}
