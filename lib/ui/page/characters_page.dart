import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/blocs/character/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/text.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';
import 'package:rick_and_morty_app/ui/widgets/image.dart';

const ITEM_EXTENT_HEIGHT = 400.0;
const ADDITINAL_DATA_VIEW_HEIGHT = 94.0;

class CharactersPage extends StatefulWidget {
  static const routeName = '/character';
  const CharactersPage({Key key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  CharacterBloc get _getBloc => BlocProvider.of<CharacterBloc>(context);

  @override
  void initState() {
    _getBloc.onStart();
    super.initState();
  }

  Widget _buildScreen(state) => Container(
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
        child: EasyRefresh.builder(
            header: BallPulseHeader(
                enableHapticFeedback: false, color: Colors.black),
            footer: BallPulseFooter(
                enableHapticFeedback: false, color: Colors.black),
            controller: state.refreshController,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            onRefresh: () async => _getBloc.onRefresh(),
            onLoad: () async => _getBloc.onPageFetch(),
            builder: (context, physics, header, footer) => CustomScrollView(
                  physics: physics,
                  slivers: [
                    header,
                    SliverPadding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
                      sliver: SliverFixedExtentList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              _buildListItem(state.result[index]),
                          addAutomaticKeepAlives: true,
                          childCount: state.result.length,
                        ),
                        itemExtent: ITEM_EXTENT_HEIGHT,
                      ),
                    ),
                    (state.result.length == state.info.count)
                        ? SliverToBoxAdapter(child: Container())
                        : footer
                  ],
                )),
      );

  Widget _buildListItem(CharacterResult character) => Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: buildImage(character.image),
              ),
              _buildAdditinalDataView(character),
            ],
          ),
          _buildSplashView(character)
        ],
      );

  Widget _buildSplashView(CharacterResult character) => Container(
      padding: EdgeInsets.only(top: 25),
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.amber.shade50.withOpacity(.5),
                splashColor: Colors.green.shade300.withOpacity(.6),
                onTap: () => _getBloc.onItemTapped(character.id),
              ))));

  Widget _buildAdditinalDataView(CharacterResult character) => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: ADDITINAL_DATA_VIEW_HEIGHT,
          width: double.infinity,
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
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.green,
                blurRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextCustom(
                      text: character.name, fontSizeType: FontSizeType.middle),
                ),
                buildStatusView(character.status, character.species),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextCustom(
                      text: 'Last known location: ${character.location.name}',
                      fontSizeType: FontSizeType.little),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: emptyAppBar(),
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (ctx, state) => state.when(
                  loading: buildProgressLoadingWithBackground,
                  update: _buildScreen,
                  loaded: _buildScreen,
                  error: (s) => buildErrorForm(s.error,
                      clickHandler: _getBloc.onRepeatClicked),
                )),
      ));
}
