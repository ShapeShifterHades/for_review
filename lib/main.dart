import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_review/blocs/item/item_bloc.dart';
import 'package:for_review/constants.dart';
import 'package:for_review/repository/items_repository.dart';
import 'package:for_review/screens/items_view/items_view.dart';
import 'package:for_review/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const ItemsApp());
}

class ItemsApp extends StatelessWidget {
  const ItemsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          ItemBloc(itemsRepository: ItemsRepository())..add(StartApp()),
      child: const MaterialApp(
          title: kAppTitle,
          home: Scaffold(
              backgroundColor: kBackgroundColor,
              body: SafeArea(child: ItemsView()))),
    );
  }
}
