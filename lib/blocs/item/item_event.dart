part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartApp extends ItemEvent {}

class AddItem extends ItemEvent {}

class DeleteItem extends ItemEvent {
  final int index;
  DeleteItem({required this.index});

  @override
  List<Object> get props => [index];
}

class ItemsUpdated extends ItemEvent {
  final List<Item> items;

  ItemsUpdated(this.items);

  @override
  List<Object> get props => [items];
}
