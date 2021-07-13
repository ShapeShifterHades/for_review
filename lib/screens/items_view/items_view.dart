import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_review/blocs/item/item_bloc.dart';
import 'package:for_review/constants.dart';
import 'package:for_review/screens/items_view/widgets/item_tile.dart';
import 'package:for_review/screens/items_view/widgets/items_appbar.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemsState>(
      builder: (context, state) {
        return CustomScrollView(controller: controller, slivers: <Widget>[
          if (state is ItemsLoaded)
            ItemsAppBar(
              controller: controller,
              title: '$kGoods ${state.items.length}',
              onTap: () {
                BlocProvider.of<ItemBloc>(context).add(AddItem());
                setState(() {});
                controller.animateTo(0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.bounceIn);
              },
            )
          else
            ItemsAppBar(controller: controller, title: kLoading, onTap: () {}),
          if (state is ItemsLoaded) ...[
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, index) {
                  return ItemTile(
                      item: state.items[index],
                      index: index,
                      onTap: () {
                        BlocProvider.of<ItemBloc>(context)
                            .add(DeleteItem(index: index));
                        setState(() {});
                      });
                },
                childCount: state.items.length,
              ),
            ),
          ] else
            const SliverFillRemaining(
              child: Center(
                  child: CircularProgressIndicator(color: kPrimaryColor)),
            )
        ]);
      },
    );
  }
}
