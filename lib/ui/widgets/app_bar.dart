import 'package:flutter/material.dart';

PreferredSizeWidget appBarElevationBackButton(String title) => PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Container(
            width: 25,
          )
        ],
        title: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            title,
            style: TextStyle(foreground: Paint()..shader = linearGradient),
          ),
        ),
        backgroundColor: Colors.amber.shade100,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
    );

const TITLE_FIRST_SCREEN = 'The Rick and Morty';

final Shader linearGradient = LinearGradient(
  colors: [Colors.green, Colors.amber.shade400],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

PreferredSizeWidget emptyAppBar() => PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          TITLE_FIRST_SCREEN,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient),
        ),
      ),
      backgroundColor: Colors.amber.shade100,
    ));
