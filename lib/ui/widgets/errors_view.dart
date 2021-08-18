import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';

Widget buildErrorForm(String text,
        {Function() clickHandler, bool isValidImage}) =>
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
        child: buildForm(
          text,
          clickHandler,
          'ОК',
          isValidImage,
        ));

Widget buildForm(String text, Function() clickHandler, String textBtn,
        bool isValidImage) =>
    Center(
      child: ErrorForm(
          onClickHandler: clickHandler,
          text: text,
          textButton: textBtn,
          isValidImage: isValidImage),
    );

class ErrorForm extends StatelessWidget {
  final String text;
  final Function() onClickHandler;
  final String textButton;
  final bool isValidImage = false;

  const ErrorForm({
    @required this.text,
    @required this.onClickHandler,
    @required this.textButton,
    isValidImage,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 180,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
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
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 16,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(ERROR_TITLE,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.red)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              isValidImage
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Container(
                        height: 30,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.green.shade300,
                          child: InkWell(
                            highlightColor:
                                Colors.amber.shade50.withOpacity(.5),
                            splashColor: Colors.green.shade300.withOpacity(.6),
                            onTap: onClickHandler,
                            child: Center(
                              child: Text(textButton.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      letterSpacing: 1.2,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),
      );
}
