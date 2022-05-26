import 'package:app_nha_dat/provider/items_model_provider.dart';
import 'package:app_nha_dat/util/list_item/list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersAppWidget extends StatefulWidget {
  const OthersAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OthersAppWidget> createState() => _OthersAppWidgetState();
}

class _OthersAppWidgetState extends State<OthersAppWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _packageInfo = info;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.width * .3,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 5),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Provider.of<ItemsModelChangeNotifier>(context)
                .otherAppInforModelLists
                .where((otherAppInforModelItem) =>
                    otherAppInforModelItem.bundleId != _packageInfo.packageName)
                .toList()
                .length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  final Uri _url = Uri.parse(
                      Provider.of<ItemsModelChangeNotifier>(context,
                              listen: false)
                          .otherAppInforModelLists[index]
                          .trackViewUrl!);
                  if (!await launchUrl(_url)) {
                    throw 'Could not launch $_url';
                  }
                  if (await canLaunchUrl(_url)) {
                    await launchUrl(_url);
                  }
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                          imageUrl:
                              Provider.of<ItemsModelChangeNotifier>(context)
                                  .otherAppInforModelLists[index]
                                  .artworkUrl100!,
                          fit: BoxFit.cover,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RatingBarIndicator(
                                itemSize: 18,
                                rating: Provider.of<ItemsModelChangeNotifier>(
                                        context)
                                    .otherAppInforModelLists[index]
                                    .averageUserRating!,
                                itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )),
                            Text(
                              "(" +
                                  Provider.of<ItemsModelChangeNotifier>(context)
                                      .otherAppInforModelLists[index]
                                      .userRatingCount
                                      .toString() +
                                  ")",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Text(
                          Provider.of<ItemsModelChangeNotifier>(context)
                              .otherAppInforModelLists[index]
                              .trackName!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )))));
  }
}
