import 'dart:io';
import 'package:app_nha_dat/UI/child_widget/detail_item/description_detail_item/description_widget.dart';
import 'package:app_nha_dat/UI/child_widget/upgrade/upgrade_widget.dart';
import 'package:app_nha_dat/UI/child_widget/specifications_widget.dart';
import 'package:app_nha_dat/UI/others_app_widget.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/provider/items_model_provider.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:app_nha_dat/util/hive_manager/hive_manager.dart';
import 'package:app_nha_dat/util/size_manager/size_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailItemWidget extends StatefulWidget {
  ItemsModel? itemsModel;
  DetailItemWidget({
    Key? key,
    this.itemsModel,
  }) : super(key: key);

  @override
  State<DetailItemWidget> createState() => _DetailItemWidgetState();
}

class _DetailItemWidgetState extends State<DetailItemWidget> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  bool isLock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorAppManager.primaryColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              decoration:
                  BoxDecoration(color: ColorAppManager.boxDetailWidgetBgColor),
              child: Stack(children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.itemsModel!.thumbUrl!,
                          height: SizeManager.setHeightThumbUrlItem(
                              MediaQuery.of(context).size.width, context, 0),
                          fit: BoxFit.cover,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    end: Alignment(0.0, 0.4),
                                    begin: Alignment(0.0, -1),
                                    colors: [
                                  Color(0xff001915),
                                  Color.fromRGBO(0, 25, 21, 0.5),
                                  Color.fromRGBO(0, 25, 21, 0)
                                ]))),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/button_bg2.png"),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              // shape: RoundedRectangleBorder(
                                              // side: const BorderSide(
                                              //     width: 2.5,
                                              //     color: Colors.black),
                                              // borderRadius:
                                              //     BorderRadius.circular(
                                              //         25)
                                              // ),
                                              primary: Colors.white,
                                              textStyle: FontsAppManager()
                                                  .textStyle(
                                                      "SVN-Coder's-Crux",
                                                      FontWeight.w400,
                                                      FontStyle.normal,
                                                      25),
                                              // backgroundColor:
                                              //     ColorAppManager.backgroundBtn
                                            ),
                                            onPressed: () {
                                              Provider.of<ItemsModelChangeNotifier>(
                                                      context,
                                                      listen: false)
                                                  .selectItem("download",
                                                      widget.itemsModel!);
                                            },
                                            child: Text(
                                              widget.itemsModel!.downloaded ==
                                                          null ||
                                                      widget.itemsModel!
                                                              .downloaded ==
                                                          false
                                                  ? "Download"
                                                  : "Install",
                                              textAlign: TextAlign.center,
                                              // 'Unlock for 2000 coins',
                                            ))
                                      ],
                                    ))),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  decoration: BoxDecoration(
                                    color: ColorAppManager.backgroundBtn,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: Colors.black, width: 2.5),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Provider.of<ItemsModelChangeNotifier>(
                                              context,
                                              listen: false)
                                          .selectItem(
                                              "like", widget.itemsModel!);
                                    },
                                    child: widget.itemsModel!.liked != null &&
                                            widget.itemsModel!.liked!
                                        ? Image.asset("assets/images/liked.png")
                                        : Image.asset(
                                            "assets/images/like_not.png"))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      icon: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: Text(widget.itemsModel!.itemName!,
                          style: FontsAppManager().textStyle(
                              "SVN-Determination",
                              FontWeight.w400,
                              FontStyle.normal,
                              18,
                              color: Colors.white)),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                        ))
                  ],
                )),
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpecificationsWidget(
                      itemsModel: widget.itemsModel!,
                    ),
                    DescriptionWidget(text: widget.itemsModel!.description!),
                    Html(
                        style: {"p": Style(color: Colors.white)},
                        data:
                            """<p>${widget.itemsModel!.htmlDescription ?? ""}</p>"""),
                    Divider(
                      color: ColorAppManager.dividerColor,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Text("Others App",
                            style: FontsAppManager().textStyle(
                                "SVN-Determination",
                                FontWeight.w400,
                                FontStyle.normal,
                                22,
                                color: Colors.white))),
                    const OthersAppWidget()
                  ]))
        ])));
  }

  Future<void> dialogAd() {
    return showDialog(
        context: context, builder: (cxt) => const UpgradeWidget());
  }
}
