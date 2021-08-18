import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';

Widget buildImage(String url,
        {bool isAllCornerRounded = false, bool isDetailScreen = false}) =>
    Container(
      height: 280,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white.withOpacity(.6),
            Colors.amber.shade100,
            Colors.amber.shade200,
          ],
        ),
        borderRadius: isAllCornerRounded
            ? BorderRadius.all(Radius.circular(20))
            : BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: <BoxShadow>[
          isDetailScreen
              ? BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                )
              : BoxShadow(
                  color: Colors.green,
                  blurRadius: 2,
                ),
        ],
      ),
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) =>
                buildErrorForm(ERROR_IMAGE_TEXT, isValidImage: true),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade100),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
