import 'package:app_nha_dat/model/items_model.dart';
import 'package:hive/hive.dart';

class HiveManager {
  static String boxNameItemsModelListSelect = "ItemsModelListBox";
  static String keyNameItemsModelList = "ItemsModelListKey";

  static openBox() async {
    return await Hive.openBox(boxNameItemsModelListSelect);
  }

  static saveItemsModelListSelect(List<ItemsModel> itemsModelList) {
    return Hive.box(boxNameItemsModelListSelect)
        .put(keyNameItemsModelList, itemsModelList);
  }

  static getItemsModelListSelect() {
    return Hive.box(boxNameItemsModelListSelect).get(keyNameItemsModelList);
  }
}
