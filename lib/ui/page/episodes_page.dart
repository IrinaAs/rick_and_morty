import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/blocs/episode/bloc.dart';
import 'package:rick_and_morty_app/blocs/episode/episode_bloc.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';
import 'package:rick_and_morty_app/ui/widgets/item_list.dart';

class EpisodesPage extends StatefulWidget {
  static const routeName = '/episodes';
  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage>
    with SingleTickerProviderStateMixin {
  EpisodeBloc get _getBloc => BlocProvider.of<EpisodeBloc>(context);

  @override
  void initState() {
    _getBloc.onStart();
    super.initState();
  }

  Widget _buildScreen(Update state) => Container(
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
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        itemCount: state.result.length,
        itemBuilder: (context, i) => ItemList(
            text1: state.result[i].name,
            text2: state.result[i].air_date,
            onClickHandler: () => _getBloc.onItemTapped(state.result[i].id)),
        addAutomaticKeepAlives: true,
      ));

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBarElevationBackButton(LIST_EPISODE_TITLE),
      body: SafeArea(
        child: BlocBuilder<EpisodeBloc, EpisodeState>(
            builder: (ctx, state) => state.when(
                  loading: buildProgressLoadingWithBackground,
                  update: _buildScreen,
                  error: (s) => buildErrorForm(s.error,
                      clickHandler: _getBloc.onRepeatClicked),
                )),
      ));
}
