import 'package:app_nha_dat/UI/child_widget/common_button_widget.dart';
import 'package:app_nha_dat/UI/child_widget/detail_item/detail_item_widget.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/provider/items_model_provider.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:app_nha_dat/util/size_manager/size_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemsWidget extends StatefulWidget {
  ItemsModel itemsModel;
  ItemsWidget({Key? key, required this.itemsModel}) : super(key: key);
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  GlobalKey globalKey = GlobalKey();
  Size? size;
  List<ItemsModel> list = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _getSizes();
      if (mounted) {
        if (size != null) {
          SizeManager.setTotalSpaceHorizontal(size!.width, context);
        }
      }
    });
    Provider.of<ItemsModelChangeNotifier>(context, listen: false)
        .getListItemSelected(widget.itemsModel);
  }

  _getSizes() {
    if (globalKey.currentContext != null) {
      final RenderBox renderBox =
          globalKey.currentContext!.findRenderObject() as RenderBox;
      setState(() => size = renderBox.size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: globalKey,
        padding: EdgeInsets.only(bottom: SizeManager.totalSpaceHorizontal! / 3),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailItemWidget(
                            itemsModel: widget.itemsModel,
                          )));
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorAppManager.boxWidgetBgColor),
                  margin: EdgeInsets.only(
                    top: SizeManager.totalSpaceHorizontal!,
                    left: (SizeManager.totalSpaceHorizontal!) / 2,
                    right: (SizeManager.totalSpaceHorizontal!) / 2,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: SizeManager.totalSpaceHorizontal!,
                        right: SizeManager.totalSpaceHorizontal!),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl: widget.itemsModel.imageUrl!,
                                    width: MediaQuery.of(context).size.width,
                                    height: size != null
                                        ? SizeManager.setHeightImageUrlItem(
                                            size!.width,
                                            context,
                                            SizeManager.totalSpaceHorizontal! *
                                                2)
                                        : 0,
                                    // alignment: Alignment.topCenter,
                                    fit: BoxFit.cover,
                                  )),
                              widget.itemsModel.isPremium!
                                  ? Image.asset(
                                      "assets/images/icon_prenium.png")
                                  : const SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: SizeManager.totalSpaceHorizontal! / 3,
                                bottom: SizeManager.totalSpaceHorizontal! / 3),
                            child: Text(widget.itemsModel.itemName!,
                                textAlign: TextAlign.center,
                                style: FontsAppManager().textStyle(
                                    "SVN-Determination",
                                    FontWeight.w400,
                                    FontStyle.normal,
                                    14,
                                    color: ColorAppManager.heading))),
                        Text(typeId(widget.itemsModel.typeId!),
                            style: FontsAppManager().textStyle(
                                "SVN-Coder's-Crux",
                                FontWeight.w400,
                                FontStyle.normal,
                                20,
                                color: Colors.white)),
                        CommonBtnWidget(
                          txtbtn: widget.itemsModel.downloaded == null ||
                                  widget.itemsModel.downloaded == false
                              ? "Download"
                              : "Install",
                          onPressed: () async {
                            Provider.of<ItemsModelChangeNotifier>(context,
                                    listen: false)
                                .selectItem("download", widget.itemsModel);
                          },
                        ),
                      ],
                    ))
              ],
            )));
  }

  String typeId(String typeId, {String typeName = ''}) {
    switch (typeId) {
      case "1":
        typeName = "AddOns";
        break;
      case "3":
        typeName = "Maps";
        break;
      // case "4":
      //   typeName = "Skins";
      //   break;
      case "5":
        typeName = "Textures";
        break;
      // case "6":
      //   typeName = "Seeds";
      //   break;
    }
    return typeName;
    // if (int.parse(typeId).isOdd) {
    // return typeName;
    // } else {
    //   return '';
    // }
  }
}
