import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/blocs/location/bloc.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/item_sliver_fixed_extent_list.dart';
import 'package:rick_and_morty_app/ui/widgets/app_bar.dart';
import 'package:rick_and_morty_app/ui/widgets/build_indicator_view.dart';
import 'package:rick_and_morty_app/ui/widgets/errors_view.dart';

class LocationsPage extends StatefulWidget {
  static const routeName = '/locations';
  const LocationsPage({Key key}) : super(key: key);

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  LocationBloc get _getBloc => BlocProvider.of<LocationBloc>(context);

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
                              text2: state.result[index].type,
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
      appBar: appBarElevationBackButton(LIST_LOCATION_TITLE),
      body: SafeArea(
        child: BlocBuilder<LocationBloc, LocationState>(
            builder: (ctx, state) => state.when(
                  loading: buildProgressLoadingWithBackground,
                  update: _buildScreen,
                  loaded: _buildScreen,
                  error: (s) => buildErrorForm(s.error,
                      clickHandler: _getBloc.onRepeatClicked),
                )),
      ));
}
