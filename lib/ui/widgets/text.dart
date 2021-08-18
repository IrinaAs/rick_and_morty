import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/widgets/circle.dart';

enum FontSizeType { big, middle, little }

class TextCustom extends StatelessWidget {
  final String text;
  final FontSizeType fontSizeType;

  const TextCustom({
    @required this.text,
    @required this.fontSizeType,
  });

  double _fontSize(FontSizeType type) {
    switch (type) {
      case FontSizeType.big:
        return 30;
        break;
      case FontSizeType.middle:
        return 18;
        break;
      case FontSizeType.little:
        return 12;
        break;
    }
    return 12;
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: _fontSize(fontSizeType)),
        ),
      );
}

Widget buildStatusView(String status, String species) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Circle(status: status),
        TextCustom(
            text: '$status - $species', fontSizeType: FontSizeType.little)
      ],
    );
