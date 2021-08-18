import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/blocs/episode/bloc.dart';
import 'package:rick_and_morty_app/blocs/episode/episode_bloc.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/item_sliver_fixed_extent_list.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';

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
                          (context, index) => ItemSliverfixExList(
                              text1: state.result[index].name,
                              text2: state.result[index].air_date,
                              onClickHandler: () => _getBloc
                                  .onItemTapped(state.result[index].id)),
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

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBarElevationBackButton(LIST_EPISODE_TITLE),
      body: SafeArea(
        child: BlocBuilder<EpisodeBloc, EpisodeState>(
            builder: (ctx, state) => state.when(
                  loading: buildProgressLoadingWithBackground,
                  update: _buildScreen,
                  loaded: _buildScreen,
                  error: (s) => buildErrorForm(s.error,
                      clickHandler: _getBloc.onRepeatClicked),
                )),
      ));
}
