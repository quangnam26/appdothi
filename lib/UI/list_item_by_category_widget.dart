import 'package:app_nha_dat/UI/child_widget/items_widget.dart';
import 'package:app_nha_dat/UI/child_widget/menu_widget/menu_widget.dart';
import 'package:app_nha_dat/UI/others_app_widget.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/provider/items_model_provider.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:app_nha_dat/util/size_manager/size_manager.dart';
import 'package:app_nha_dat/util/string_util/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ListItembyCategoryWidget extends StatefulWidget {
  const ListItembyCategoryWidget({Key? key}) : super(key: key);

  @override
  State<ListItembyCategoryWidget> createState() =>
      _ListItembyCategoryWidgetState();
}

class _ListItembyCategoryWidgetState extends State<ListItembyCategoryWidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Future.delayed(
      const Duration(),
      () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    );

    Provider.of<ItemsModelChangeNotifier>(context, listen: false)
        .getListItemsModel();
    Provider.of<ItemsModelChangeNotifier>(context, listen: false).otherApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var itemsModelChangeNotifierWatch =
        Provider.of<ItemsModelChangeNotifier>(context);

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            drawer: const MenuWidget(),
            backgroundColor: ColorAppManager.primaryColor,
            appBar: AppBar(
              backgroundColor: ColorAppManager.appBarColor,
              elevation: 0.0,
              title: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: textEditingController,
                  onChanged: (text) =>
                      setState(() => textEditingController.text),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            ),
            body: SafeArea(
                child: DefaultTabController(
                    length: itemsModelChangeNotifierWatch.keysTab.length,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.width * 0.09,
                              decoration: BoxDecoration(
                                  color: const Color(0xff4D5E5C),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all()),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: TabBar(
                                  onTap: (value) {
                                    textEditingController.clear();
                                  },
                                  isScrollable: true,
                                  labelStyle: FontsAppManager().textStyle(
                                      "SVN-Determination",
                                      FontWeight.w400,
                                      FontStyle.normal,
                                      16),
                                  indicatorWeight: 0,
                                  indicator: BoxDecoration(
                                      color: const Color(0xff04570F),
                                      borderRadius: BorderRadius.circular(4)),
                                  labelColor: Colors.white,
                                  indicatorColor: Colors.transparent,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: itemsModelChangeNotifierWatch.keysTab
                                      .map(
                                        (key) => Tab(
                                            child: FittedBox(
                                              child: key.isNotEmpty
                                                  ? Text(
                                                      key
                                                          .split(" ")
                                                          .map((str) => str
                                                              .capitalizedWords)
                                                          .join(" "),
                                                      textAlign:
                                                          TextAlign.center)
                                                  : const Text(' '),
                                            ),
                                            iconMargin: const EdgeInsets.only(
                                                bottom: 0)),
                                      )
                                      .toList())),
                          Expanded(
                              child: TabBarView(children: [
                            for (var i = 0;
                                i <
                                    itemsModelChangeNotifierWatch
                                        .keysTab.length;
                                i++)
                              Builder(builder: (_) {
                                return SingleChildScrollView(
                                    child: itemsModelChangeNotifierWatch
                                                .keysTab[i] ==
                                            "Others App"
                                        ? const OthersAppWidget()
                                        : gridviewBasedOnSearchField(
                                            textEditingController.text,
                                            itemsModelChangeNotifierWatch
                                                    .categoryMap[
                                                itemsModelChangeNotifierWatch
                                                    .keysTab[i]]!));
                              })
                          ]))
                        ])))));
  }

  GridView gridviewBasedOnSearchField(
      String text, List<ItemsModel> itemsModelList) {
    var listBasedOnSearchResult = itemsModelList
        .where((itemsModel) => itemsModel.itemName!
            .toString()
            .toLowerCase()
            .contains(text.toLowerCase()))
        .toList();
    return GridView.builder(
        controller: ScrollController(),
        shrinkWrap: true,
        itemCount: text.isNotEmpty
            ? listBasedOnSearchResult.length
            : itemsModelList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 480 ? 1 : 2,
          mainAxisSpacing:
              text.isNotEmpty && listBasedOnSearchResult.isEmpty ? 0 : 8,
          crossAxisSpacing:
              text.isNotEmpty && listBasedOnSearchResult.isEmpty ? 0 : 8,
          childAspectRatio: SizeManager.setChildAspectRatio(
              1 / SizeManager.ratioHvsWImageUrl),
        ),
        itemBuilder: (cxt, index) => ItemsWidget(
            itemsModel: text.isNotEmpty
                ? listBasedOnSearchResult[index]
                : itemsModelList[index]));
  }
}
