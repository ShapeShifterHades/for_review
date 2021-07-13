import 'package:flutter/material.dart';

const String kAppTitle = 'Item App';
const String kLoading = 'Загрузка';
const String kGoods = 'Товаров: ';
const Color kBackgroundColor = Colors.black;
const Color kPrimaryColor = Colors.indigo;
const Color kTextColor = Colors.white;

const Map<String, List<Map<String, dynamic>>> kFakeData = {
  "data": [
    {"name": "Товар #1", "url": "https://picsum.photos/id/14/500/500"},
    {"name": "Товар #2", "url": "https://picsum.photos/id/42/500/500"},
    {"name": "Товар #3", "url": "https://picsum.photos/id/25/500/500"},
  ]
};
