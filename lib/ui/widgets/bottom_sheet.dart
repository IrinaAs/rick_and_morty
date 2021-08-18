import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/data/models/fields/character_result.dart';

class BottomSheetCustom extends StatefulWidget {
  static int idCharacter;
  final List<CharacterResult> characterDetailResults;
  final Function() onItemTapped;

  const BottomSheetCustom({
    @required this.characterDetailResults,
    @required this.onItemTapped,
  });

  @override
  _BottomSheetCustomState createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white.withOpacity(.6),
            Colors.amber.shade100,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.red.shade100,
            blurRadius: 2,
          ),
        ],
      ),
      child: ListView.builder(
          itemCount: widget.characterDetailResults.length,
          itemBuilder: (context, i) => Material(
                color: Colors.transparent,
                child: InkWell(
                    highlightColor: Colors.amber.shade50.withOpacity(.5),
                    splashColor: Colors.green.shade300.withOpacity(.6),
                    onTap: () {
                      BottomSheetCustom.idCharacter = i;
                      return widget.onItemTapped();
                    },
                    child: ListTile(
                        title: Text(widget.characterDetailResults[i].name))),
              )));
}
