import 'package:app_nha_dat/UI/child_widget/menu_widget/download/list_item_download.dart';
import 'package:app_nha_dat/UI/child_widget/menu_widget/like/list_item_favourite.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: SafeArea(
          child: Column(
        children: [
          const Text("username"),
          const Divider(
            color: Colors.red,
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text("shop"),
            icon: const Icon(Icons.shop),
          ),
          TextButton.icon(
              onPressed: () {},
              label: const Text("about"),
              icon: const Icon(Icons.info)),
          TextButton.icon(
              onPressed: () {},
              label: const Text("share App"),
              icon: const Icon(Icons.share)),
          TextButton.icon(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const ListItemDownloadedWidget())));
              },
              label: const Text("Download"),
              icon: const Icon(Icons.download_done)),
          TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const ListItemFavouriteWidget())));
              },
              label: const Text("Liked"),
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      )),
    );
  }
}
