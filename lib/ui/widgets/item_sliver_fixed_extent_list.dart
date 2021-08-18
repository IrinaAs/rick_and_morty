import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/widgets/text.dart';

const ITEM_EXTENT_HEIGHT = 112.0;

class ItemSliverfixExList extends StatelessWidget {
  final String text1;
  // ignore: non_constant_identifier_names
  final String text2;
  final Function() onClickHandler;

  const ItemSliverfixExList({
    // ignore: non_constant_identifier_names
    @required this.text1,
    @required this.text2,
    @required this.onClickHandler,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                  ),
                ]),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.red.shade50,
                    Colors.amber.shade100,
                    Colors.amber.shade200,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Colors.amber.shade50.withOpacity(.5),
                  splashColor: Colors.green.shade300.withOpacity(.6),
                  onTap: onClickHandler,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextCustom(
                                text: text1, fontSizeType: FontSizeType.middle),
                            TextCustom(
                                text: text2, fontSizeType: FontSizeType.little)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      );
}
