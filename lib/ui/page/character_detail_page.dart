import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/blocs/character_detail/character_detail_state.dart';
import 'package:rick_and_morty_app/blocs/character_detail/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/button.dart';
import 'package:rick_and_morty_app/ui/widgets/text.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';
import 'package:rick_and_morty_app/ui/widgets/image.dart';

class CharacterDetailPage extends StatefulWidget {
  static const routeName = '/character_detail';
  const CharacterDetailPage({Key key}) : super(key: key);

  @override
  _CharacterDetailPageState createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  CharacterDetailBloc get _getBloc =>
      BlocProvider.of<CharacterDetailBloc>(context);

  Widget _buildStart() {
    _getBloc.onStart();
    return buildProgressLoadingWithBackground();
  }

  Widget _buildScreen(Update state) => Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            TextCustom(text: state.result.name, fontSizeType: FontSizeType.big),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                child: buildImage(state.result.image,
                    isAllCornerRounded: true, isDetailScreen: true),
              ),
            ),
            Expanded(child: _buildAdditinalDataView(state.result)),
            Expanded(child: _buildButtonsView()),
          ],
        ),
      );

  Widget _buildAdditinalDataView(CharacterResult character) {
    final locationText = 'Last known location: ${character.location.name}';
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildStatusView(character.status, character.species),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: TextCustom(
                    text: locationText, fontSizeType: FontSizeType.little),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsView() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Button(
                  textButton: TITLE_EPISODE_BUTTON,
                  onClickHandler: _getBloc.onEpisodeTapped,
                  dinamSizeFont: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Button(
                  textButton: TITLE_LOCATION_BUTTON,
                  onClickHandler: _getBloc.onLocationTapped,
                  dinamSizeFont: true,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarElevationBackButton(DETAIL_INFO_TITLE_CHARACTER),
        body: SafeArea(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.amber.shade100,
                Colors.green.shade200,
              ],
            )),
            child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
                builder: (ctx, state) => state.when(
                      loading: _buildStart,
                      update: (s) => _buildScreen(s),
                      error: (s) => buildErrorForm(s.error,
                          clickHandler: _getBloc.onRepeatClicked),
                    )),
          ),
        ));
  }
}
