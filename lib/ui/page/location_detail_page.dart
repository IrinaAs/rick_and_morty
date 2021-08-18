import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/blocs/location_detail/bloc.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/text.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';

class LocationDetailPage extends StatefulWidget {
  static const routeName = '/location_detail';
  const LocationDetailPage({Key key}) : super(key: key);

  @override
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  LocationDetailBloc get _getBloc =>
      BlocProvider.of<LocationDetailBloc>(context);

  Widget _buildStart() {
    _getBloc.onStart();
    return buildProgressLoadingWithBackground();
  }

  Widget _buildScreen(Update state) {
    final String type = 'Тип локации: ${state.result.type}';
    final String dimension =
        'Измерение, в котором находится местоположение: ${state.result.dimension}';
    return Container(
        margin: EdgeInsets.all(15),
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
              color: Colors.amber.shade200,
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextCustom(
                  text: state.result.name, fontSizeType: FontSizeType.big),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextCustom(text: type, fontSizeType: FontSizeType.little),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextCustom(
                  text: dimension, fontSizeType: FontSizeType.little),
            ),
            // Spacer(),
            // Предпологаю, что задумывалась такая же логика, как и для экрана детального просмотра эпизода, в тех. задание не указано.
            // Padding(
            //   padding: EdgeInsets.only(bottom: 30),
            //   child: Button(
            //       textButton: TITLE_CHARACTERS_WITH_LOCATION_BUTTON,
            //       onClickHandler: _getBloc.onCharactersWithLocationTapped,
            //       isBigButton: true),
            // ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarElevationBackButton(DETAIL_INFO_TITLE_LOCATION),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: screenHeight,
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
          child: BlocBuilder<LocationDetailBloc, LocationDetailState>(
              builder: (ctx, state) => state.when(
                    loading: _buildStart,
                    update: (s) => _buildScreen(s),
                    error: (s) => buildErrorForm(s.error,
                        clickHandler: _getBloc.onRepeatClicked),
                  )),
        )));
  }
}
