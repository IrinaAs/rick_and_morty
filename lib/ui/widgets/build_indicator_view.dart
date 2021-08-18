import 'package:flutter/material.dart';

Widget buildProgressLoadingWithBackground(
        {double height = 30, double weight = 30}) =>
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          Colors.amber.shade100,
          Colors.amber.shade200,
        ],
      )),
      child: Center(
        child: Container(
          height: height,
          width: weight,
          child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade100)),
        ),
      ),
    );

Widget buildProgressLoadingWithoutBackground(
        {double height = 30, double weight = 30}) =>
    Center(
      child: Container(
        height: height,
        width: weight,
        child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.green,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade100)),
      ),
    );
