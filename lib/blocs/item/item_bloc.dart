import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:for_review/models/item.dart';
import 'package:for_review/repository/items_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemsState> {
  final ItemsRepository _itemsRepository;
  StreamSubscription? _itemsSubscription;

  ItemBloc({required ItemsRepository itemsRepository})
      : _itemsRepository = itemsRepository,
        super(ItemsLoading());

  @override
  Stream<ItemsState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is StartApp) {
      yield* _mapStartAppToState();
    } else if (event is DeleteItem) {
      yield* _mapItemDeletedToState(event);
    } else if (event is AddItem) {
      yield* _mapItemAddedToState();
    } else if (event is ItemsUpdated) {
      yield* _mapItemsUpdateToState(event);
    }
  }

  Stream<ItemsState> _mapStartAppToState() async* {
    _itemsSubscription?.cancel();
    _itemsSubscription =
        _itemsRepository.items().listen((items) => add(ItemsUpdated(items)));
    _itemsRepository.addInitailData();
  }

  Stream<ItemsState> _mapItemDeletedToState(DeleteItem event) async* {
    _itemsRepository.deleteItem(event.index);
  }

  Stream<ItemsState> _mapItemAddedToState() async* {
    _itemsRepository.addItem();
  }

  Stream<ItemsState> _mapItemsUpdateToState(ItemsUpdated event) async* {
    yield ItemsLoaded(event.items);
  }

  @override
  Future<void> close() {
    _itemsSubscription?.cancel();
    return super.close();
  }
}
