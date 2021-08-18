import 'package:flutter/material.dart';

const HEIGHT_CIRCLE = 10.0;
const WEDTH_CIRCLE = 10.0;

class Circle extends StatelessWidget {
  final String status;

  const Circle({
    @required this.status,
  });

  Color _getColorCircle(String status) {
    if (status == 'Alive') {
      return Colors.green.shade400;
    } else if (status == 'Dead') {
      return Colors.red;
    } else if (status == 'unknown') {
      return Colors.grey.shade700;
    } else {
      return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(right: 5),
      width: WEDTH_CIRCLE,
      height: HEIGHT_CIRCLE,
      decoration: BoxDecoration(
        color: _getColorCircle(status),
        shape: BoxShape.circle,
      ));
}
