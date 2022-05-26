import 'package:app_nha_dat/UI/child_widget/menu_widget/common_widget/common_widget.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/provider/items_model_provider.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/hive_manager/hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItemFavouriteWidget extends StatefulWidget {
  const ListItemFavouriteWidget({Key? key}) : super(key: key);

  @override
  State<ListItemFavouriteWidget> createState() =>
      _ListItemFavouriteWidgetState();
}

class _ListItemFavouriteWidgetState extends State<ListItemFavouriteWidget> {
  List<String> list = [];
  @override
  void initState() {
    if (HiveManager.getItemsModelListSelect() != null) {
      print(Provider.of<ItemsModelChangeNotifier>(context, listen: false)
          .categoryMap);

      //     .forEach((key, value) {
      //   for (var item in value) {
      //     (HiveManager.getItemsModelListSelect() as List)
      //         .cast<ItemsModel>()
      //         .toList()
      //         .forEach((item2) {
      //       if (item.itemName == item2.itemName) {
      //         if (!list.contains(key) && item.liked != item2.liked
      //             // Provider.of<ItemsModelChangeNotifier>(context, listen: false)
      //             //     .categoryMap[key]!
      //             //     .contains(item)
      //             ) {
      //           list.add(key);
      //         }
      //       }
      //     });
      //   }
      // });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorAppManager.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            " Maps Favourited",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount:
                    //  HiveManager.getItemsModelListSelect() != null
                    //     ? (HiveManager.getItemsModelListSelect() as List)
                    // .cast<ItemsModel>()
                    // .where((element) => element.liked == true)
                    // .toList()
                    Provider.of<ItemsModelChangeNotifier>(context)
                        .listItemSelected
                        .where((element) => element.liked == true)
                        .toList()
                        .length
                // : 0
                ,
                itemBuilder: (context, index) {
                  return CommonWidget(
                    // str: list[index],
                    itemsModel:
                        //  (HiveManager.getItemsModelListSelect() as List)
                        //     .cast<ItemsModel>()
                        Provider.of<ItemsModelChangeNotifier>(context)
                            .listItemSelected
                            .where((element) => element.liked == true)
                            // .where((element) => element.liked == true)
                            .toList()[index],
                  );
                })));
  }
}
