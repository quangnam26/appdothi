import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpecificationsWidget extends StatefulWidget {
  SpecificationsWidget({Key? key, required this.itemsModel}) : super(key: key);
  ItemsModel itemsModel;

  @override
  State<SpecificationsWidget> createState() => _SpecificationsWidgetState();
}

class _SpecificationsWidgetState extends State<SpecificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/images/view.png")
                    // Icon(Icons.grid_view, color: Colors.white)
                    ),
                Text(widget.itemsModel.viewCount.toString(),
                    style: FontsAppManager().textStyle("SVN-Coder's-Crux",
                        FontWeight.w400, FontStyle.normal, 24,
                        color: ColorAppManager.descriptionColor))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/images/download.jpg")
                    // Icon(Icons.download, color: Colors.white)
                    ),
                Text(widget.itemsModel.downloadCount!,
                    style: FontsAppManager().textStyle("SVN-Coder's-Crux",
                        FontWeight.w400, FontStyle.normal, 24,
                        color: ColorAppManager.descriptionColor))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("assets/images/like.png")
                    // Icon(Icons.favorite, color: Colors.white)
                    ),
                Text(widget.itemsModel.likeCount.toString(),
                    style: FontsAppManager().textStyle("SVN-Coder's-Crux",
                        FontWeight.w400, FontStyle.normal, 24,
                        color: ColorAppManager.descriptionColor))
              ],
            ),
          ],
        ));
  }
}
