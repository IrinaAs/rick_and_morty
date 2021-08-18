import 'package:flutter/material.dart';

const BIG_BUTTON_HEIGHT = 160.0;
const BIG_BUTTON_WIDTH = 260.0;

class Button extends StatelessWidget {
  final String textButton;
  final Function() onClickHandler;
  final bool dinamSizeFont;

  const Button({
    @required this.textButton,
    @required this.onClickHandler,
    @required this.dinamSizeFont,
  });

  @override
  Widget build(BuildContext context) => Container(
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
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.green,
            blurRadius: 2,
          ),
        ],
      ),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.amber.shade50.withOpacity(.5),
            splashColor: Colors.green.shade300.withOpacity(.6),
            onTap: onClickHandler,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: !dinamSizeFont
                      ? Text(textButton,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15))
                      : FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            textButton,
                            textAlign: TextAlign.center,
                          ),
                        )),
            ),
          )));
}
