import 'package:app_nha_dat/UI/child_widget/menu_widget/common_widget/common_widget.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/hive_manager/hive_manager.dart';
import 'package:flutter/material.dart';

class ListItemDownloadedWidget extends StatefulWidget {
  const ListItemDownloadedWidget({Key? key}) : super(key: key);

  @override
  State<ListItemDownloadedWidget> createState() =>
      _ListItemDownloadedWidgetState();
}

class _ListItemDownloadedWidgetState extends State<ListItemDownloadedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorAppManager.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Maps Downloaded ",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: HiveManager.getItemsModelListSelect() != null
                    ? (HiveManager.getItemsModelListSelect() as List)
                        .cast<ItemsModel>()
                        .where((element) => element.downloaded == true)
                        .toList()
                        .length
                    : 0,
                itemBuilder: (context, index) {
                  return CommonWidget(
                    itemsModel: (HiveManager.getItemsModelListSelect() as List)
                        .cast<ItemsModel>()
                        .where((element) => element.downloaded == true)
                        .toList()[index],
                  );
                })));
  }
}
