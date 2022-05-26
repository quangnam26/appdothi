import 'package:hive/hive.dart';

class OthersAppModel {
  int? resultCount;
  List<OtherAppInforModel>? results;

  OthersAppModel({this.resultCount});

  OthersAppModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <OtherAppInforModel>[];
      for (var v in (json['results'] as List)) {
        results!.add(OtherAppInforModel.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherAppInforModel {
  String? artworkUrl100; //icon App
  int? userRatingCountForCurrentVersion;
  int? userRatingCount;
  double? averageUserRatingForCurrentVersion;
  double? averageUserRating;
  String? trackViewUrl; //link url laucher
  String? bundleId;
  String? trackName; //ten App

  OtherAppInforModel({
    this.artworkUrl100,
    this.userRatingCountForCurrentVersion,
    this.userRatingCount,
    this.averageUserRatingForCurrentVersion,
    this.averageUserRating,
    this.trackViewUrl,
    this.bundleId,
    this.trackName,
  });

  OtherAppInforModel.fromJson(Map<String, dynamic> json) {
    artworkUrl100 = json['artworkUrl100'];
    averageUserRatingForCurrentVersion =
        json['averageUserRatingForCurrentVersion'];
    userRatingCountForCurrentVersion = json['userRatingCountForCurrentVersion'];
    averageUserRating = json['averageUserRating'];
    trackViewUrl = json['trackViewUrl'];
    trackName = json['trackName'];
    bundleId = json['bundleId'];
    userRatingCount = json['userRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['artworkUrl100'] = artworkUrl100;
    data['averageUserRatingForCurrentVersion'] =
        averageUserRatingForCurrentVersion;
    data['userRatingCountForCurrentVersion'] = userRatingCountForCurrentVersion;
    data['averageUserRating'] = averageUserRating;
    data['trackViewUrl'] = trackViewUrl;
    data['trackName'] = trackName;
    data['bundleId'] = bundleId;
    data['userRatingCount'] = userRatingCount;
    return data;
  }
}
