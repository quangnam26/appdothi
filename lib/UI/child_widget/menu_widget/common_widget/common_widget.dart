import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatefulWidget {
  ItemsModel itemsModel;
  // String? str;

  CommonWidget({
    Key? key,
    required this.itemsModel,
    // this.str
  }) : super(key: key);

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: ColorAppManager.boxWidgetBgColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CachedNetworkImage(
              imageUrl: widget.itemsModel.thumbUrl!,
              width: 100,
              height: 100,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
                child: Text(
              "Name: " + widget.itemsModel.itemName!,
              style: const TextStyle(color: Colors.white),
            )),
            // Text(
            //   "Category: " + widget.str!,
            //   style: const TextStyle(color: Colors.white),
            // ),
            Text(
              "Type: " + typeId(widget.itemsModel.typeId.toString()),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ]),
    ));
  }

  String typeId(String typeId, {String typeName = ''}) {
    switch (typeId) {
      case "1":
        typeName = "AddOns";
        break;
      case "3":
        typeName = "Maps";
        break;

      case "5":
        typeName = "Textures";
        break;
    }
    return typeName;
  }
}
