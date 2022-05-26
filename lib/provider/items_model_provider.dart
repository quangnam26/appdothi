import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_nha_dat/api/core.dart';
import 'package:app_nha_dat/model/items_model.dart';
import 'package:app_nha_dat/model/others_app_model.dart';
import 'package:app_nha_dat/util/hive_manager/hive_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class ItemsModelChangeNotifier extends ChangeNotifier {
  final Map<String, List<ItemsModel>> _categoryMap = {};
  Map<String, List<ItemsModel>> get categoryMap => _categoryMap;

  List<String> _keysTab = <String>[];
  List<String> get keysTab => _keysTab;

  final List<OtherAppInforModel> _otherAppInforModelLists =
      <OtherAppInforModel>[];
  List<OtherAppInforModel> get otherAppInforModelLists =>
      _otherAppInforModelLists;

  List<ItemsModel> _listItemSelected = <ItemsModel>[];
  List<ItemsModel> get listItemSelected => _listItemSelected;

  Client client = Client();

  void items(String searchText) {
    Map<String, String> queryParameters;
    queryParameters = {
      'search_keyword': searchText,
      'page': "0",
    };
    var uri = Uri.https(APITarget.baseUrl, '/v1/search_items', queryParameters);
    client
        .get(uri, headers: {
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJpYXQiOjE2Mjg0ODA3NDl9._RGkfwGj8Y9BBJi6VtUKVnlRirSy6b2Xb4vCYzkjuwQ"
        })
        .timeout(const Duration(seconds: 60))
        .then((response) {
          if (response.statusCode == 200) {
            final json = jsonDecode(response.body);
            if (json != null) {
              _categoryMap[searchText] = (json['data'] as List)
                  .map((e) => ItemsModel.fromJson(e))
                  .toList();
              _keysTab = _categoryMap.keys.toList();
              if (!_keysTab.contains("Others App")) {
                _keysTab.add("Others App");
              }
              notifyListeners();
            } else {
              if (json['message'] != null) {}
            }
          }
        }, onError: (error) {
          throw error;
        });
  }

  void otherApp() {
    Map<String, String> queryParameters;
    queryParameters = {
      'id': "1585626469",
      'entity': "software",
    };
    var uri = Uri.https("itunes.apple.com", '/lookup', queryParameters);
    client.get(uri).timeout(const Duration(seconds: 60)).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json != null) {
          OthersAppModel.fromJson(json);

          if (OthersAppModel.fromJson(json).results != null) {
            for (var i = 0;
                i < OthersAppModel.fromJson(json).results!.length;
                i++) {
              if (i != 0 &&
                  !otherAppInforModelLists
                      .contains(OthersAppModel.fromJson(json).results![i])) {
                otherAppInforModelLists
                    .add(OthersAppModel.fromJson(json).results![i]);
              }
            }
          }
          notifyListeners();
        } else {
          if (json['message'] != null) {}
        }
      }
    }, onError: (error) {
      throw error;
    });
  }

  getListItemsModel() {
    items("modern");
    items("modern house");
    items("city");
    items("modern neighbourhood");
    items("neighbourhood");
    items("house");
    items("skyblock");
    items("parko");
    items("raid");
  }

  getListItemSelected(ItemsModel itemsModel) {
    if (HiveManager.getItemsModelListSelect() != null) {
      _listItemSelected = (HiveManager.getItemsModelListSelect() as List)
          .cast<ItemsModel>()
          .toList();
      if (_listItemSelected.isNotEmpty) {
        for (var element in _listItemSelected) {
          if (itemsModel.itemName == element.itemName &&
              itemsModel.typeId == element.typeId) {
            // setState(() {
            if (element.liked != null) {
              itemsModel.liked = element.liked;
            } else {
              itemsModel.liked = false;
            }
            if (element.downloaded != null) {
              itemsModel.downloaded = element.downloaded;
            } else {
              itemsModel.downloaded = false;
            }
            // });
            // notifyListeners();
          } else {
            itemsModel.liked ??= false;
            itemsModel.downloaded ??= false;
          }
        }
      } else {
        itemsModel.liked = false;
        itemsModel.downloaded = false;
      }
    } else {
      itemsModel.downloaded = false;
      itemsModel.liked = false;
    }
  }

  selectItem(String typeFunc, ItemsModel itemsModel) async {
    switch (typeFunc) {
      case "download":
        if (itemsModel.downloaded != null && itemsModel.downloaded!) {
          SVProgressHUD.showSuccess(status: "you was downloaded");
        } else {
          if (!itemsModel.isPremium!) {
            SVProgressHUD.showProgress(0.9, status: "Downloading...");

            var req = await http.Client().get(Uri.parse(itemsModel.fileUrl!));
            var file = File(
                '${(await getExternalStorageDirectory())!.path}/${itemsModel.fileUrl!.split("/").last.trim()}');
            file.writeAsBytes(req.bodyBytes);
            itemsModel.fileUrldownloaded =
                "${itemsModel.itemId}:${(await getExternalStorageDirectory())!.path}/${itemsModel.fileUrl!.split("/").last.trim()}";

            SVProgressHUD.showSuccess(status: "you're download success");

            itemsModel.downloaded = true;

            notifyListeners();
            SVProgressHUD.dismiss();

            var check = _listItemSelected
                .where((item) => itemsModel.itemName == item.itemName)
                .isNotEmpty;
            if (!check) {
              _listItemSelected.add(itemsModel);
            }

            HiveManager.saveItemsModelListSelect(_listItemSelected);
          }
          if (itemsModel.isPremium!) {
            // setState(() {
            //   isLock = false;
            //   if (!isLock) {
            //     dialogAd();
            //   }
            // });
          }
        }
        break;
      case "like":
        print(_listItemSelected);
        itemsModel.liked = !itemsModel.liked!;

        if (itemsModel.liked!) {
          var check = _listItemSelected
              .where((item) => itemsModel.itemName == item.itemName)
              .isNotEmpty;

          if (!check) {
            _listItemSelected.add(itemsModel);
          }
        } else {
          if (itemsModel.downloaded == null || !itemsModel.downloaded!) {
            _listItemSelected.removeWhere(
                (element) => element.itemName == itemsModel.itemName);
          } else {
            for (var element in _listItemSelected) {
              if (element.itemName == itemsModel.itemName) {
                element.liked = itemsModel.liked;
              }
            }
          }
        }

        HiveManager.saveItemsModelListSelect(_listItemSelected);
        notifyListeners();
    }
  }
}
