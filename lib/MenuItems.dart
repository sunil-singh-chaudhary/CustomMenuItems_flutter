import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:menu_bar_flutter/models/items.dart';

class Menuitems {
  static const List<items> itemfirstList = [itemsetting, itemShare];
  static const List<items> itemSecList = [itemLogout];

  static const itemsetting = items(
    name: "Setting",
    icon: Icons.settings,
  );
  static const itemShare = items(
    name: "Share",
    icon: Icons.share,
  );
  static const itemLogout = items(
    name: "Logout",
    icon: Icons.logout,
  );
}
