import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/blocs/episode_detail.dart/bloc.dart';
import 'package:rick_and_morty_app/blocs/episode_detail.dart/episode_detail_bloc.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/bottom_sheet.dart';
import 'package:rick_and_morty_app/ui/widgets/button.dart';
import 'package:rick_and_morty_app/ui/widgets/text.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';

class EpisodeDetailPage extends StatefulWidget {
  static const routeName = '/episode_detail';
  const EpisodeDetailPage({Key key}) : super(key: key);

  @override
  _EpisodeDetailPageState createState() => _EpisodeDetailPageState();
}

class _EpisodeDetailPageState extends State<EpisodeDetailPage> {
  EpisodeDetailBloc get _getBloc => BlocProvider.of<EpisodeDetailBloc>(context);

  Widget _buildStart() {
    _getBloc.onStart();
    return buildProgressLoadingWithBackground();
  }

  Widget _buildScreen(Update state) {
    final dataOutEpisode = 'Дата выхода серии: ${state.episodeResult.air_date}';
    final episode = 'Серия: ${state.episodeResult.episode}';
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
            color: Colors.green.shade200,
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
                text: state.episodeResult.name, fontSizeType: FontSizeType.big),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextCustom(
                text: dataOutEpisode, fontSizeType: FontSizeType.little),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextCustom(text: episode, fontSizeType: FontSizeType.little),
          ),
          Spacer(),
          state.isOpenedBottomSheet ? _buildIndicatorView() : Container(),
          state.isOpenedBottomSheet
              ? Container()
              : Container(
                  height: BIG_BUTTON_HEIGHT,
                  width: BIG_BUTTON_WIDTH,
                  padding: EdgeInsets.only(bottom: 30, left: 40, right: 50),
                  child: Button(
                    textButton: TITLE_LIST_CHARACTERS_WITH_EPISODE_BUTTON,
                    onClickHandler: _getBloc.onCharactersWithEpisodeTapped,
                    dinamSizeFont: false,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildIndicatorView() => Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: BIG_BUTTON_HEIGHT,
          width: BIG_BUTTON_WIDTH,
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
              Radius.circular(16),
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
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: buildProgressLoadingWithoutBackground(),
              ),
              TextCustom(text: DATA_LOADING, fontSizeType: FontSizeType.little)
            ],
          ),
        ),
      ));

  void _showBottomSheet(ShowBottomSheet s) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) => BottomSheetCustom(
            characterDetailResults: s.characterDetailResults,
            onItemTapped: _getBloc.onItemBottomSheetClicked,
          )).then((_) => _getBloc.onClosedBottomSheet());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarElevationBackButton(DETAIL_INFO_TITLE_EPISODE),
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
              child: BlocConsumer<EpisodeDetailBloc, EpisodeDetailState>(
                  builder: (ctx, state) => state.when(
                        loading: _buildStart,
                        update: _buildScreen,
                        showBottomSheet: (s) => _buildScreen(s.previousState),
                        error: (s) => buildErrorForm(s.error,
                            clickHandler: _getBloc.onRepeatClicked),
                      ),
                  listener: (ctx, state) {
                    if (state is ShowBottomSheet) {
                      _showBottomSheet(state);
                    }
                  })),
        ));
  }
}
