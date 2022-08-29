import 'package:flutter/material.dart';
import 'package:menu_bar_flutter/MenuItems.dart';
import 'package:menu_bar_flutter/models/Settingpage.dart';
import 'package:menu_bar_flutter/models/items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewMenuIcons(),
    );
  }
}

class NewMenuIcons extends StatelessWidget {
  const NewMenuIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<items>(
            constraints: BoxConstraints.tight(Size(200, 200)),
            color: Colors.white,
            shape: TooltipShape(),
            offset: const Offset(0, 50),
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context) => [
              ...Menuitems.itemfirstList.map(buildItems).toList(),
              const PopupMenuDivider(height: 1),
              ...Menuitems.itemSecList.map(buildItems).toList()
            ],
            onSelected: (value) => onselected(context, value),
          )
        ],
      ),
    );
  }

  PopupMenuItem<items> buildItems(items items) => PopupMenuItem(
      value: items, //for getting item click event need this line
      child: Row(
        children: [
          Icon(
            items.icon,
            color: Colors.black,
          ),
          SizedBox(width: 100, child: Text(items.name))
        ],
      ));

  onselected(BuildContext context, items value) {
    switch (value) {
      case Menuitems.itemsetting:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settingpage(),
        ));

        break;
      case Menuitems.itemShare:
        break;
      case Menuitems.itemLogout:
        break;
    }
  }
}

/// I'm using [RoundedRectangleBorder] as my reference...
class TooltipShape extends ShapeBorder {
  const TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rrect.width - 30, 0);
    path.lineTo(rrect.width - 20, -10);
    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}
