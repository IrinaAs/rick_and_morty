import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/repository/episode_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/ui/page/characters_page.dart';
import 'package:rick_and_morty_app/ui/page/locations_page.dart';
import 'blocs/character/character_bloc.dart';
import 'blocs/character_detail/bloc.dart';
import 'blocs/episode/episode_bloc.dart';
import 'blocs/episode_detail.dart/episode_detail_bloc.dart';
import 'blocs/location/location_bloc.dart';
import 'blocs/location_detail/location_detail_bloc.dart';
import 'data/repository/location_repository.dart';
import 'navigation/core/navigation_controller.dart';
import 'navigation/core/smart_navigation.dart';
import 'ui/page/character_detail_page.dart';
import 'ui/page/episode_detail_page.dart';
import 'ui/page/episodes_page.dart';
import 'ui/page/location_detail_page.dart';

void main() => Future<void>(() => WidgetsFlutterBinding.ensureInitialized())
    .whenComplete(() => runApp(Application()));

class Application extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final NavigationController _navigationController = NavigationController();

  @override
  Widget build(BuildContext context) {
    SmartNavigation(_navigatorKey, _navigationController);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: <Locale>[Locale('en', 'US'), Locale('ru', 'RU')],
      theme: ThemeData(
        accentColor: Colors.green,
        fontFamily: 'PFBeauSansPro-Regular',
      ),
      title: 'Rick and morty app',
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: CharactersPage.routeName,
      routes: {
        CharactersPage.routeName: (context) => BlocProvider<CharacterBloc>(
            create: (ctx) => CharacterBloc(CharacterRepositoryImpl.instance(),
                _navigationController, LocalRepositoryImpl.instance()),
            child: CharactersPage()),
        CharacterDetailPage.routeName: (context) =>
            BlocProvider<CharacterDetailBloc>(
                create: (ctx) => CharacterDetailBloc(
                    _navigationController,
                    LocalRepositoryImpl.instance(),
                    CharacterRepositoryImpl.instance()),
                child: CharacterDetailPage()),
        EpisodesPage.routeName: (context) => BlocProvider<EpisodeBloc>(
            create: (ctx) => EpisodeBloc(
                _navigationController,
                EpisodeRepositoryImpl.instance(),
                LocalRepositoryImpl.instance()),
            child: EpisodesPage()),
        EpisodeDetailPage.routeName: (context) =>
            BlocProvider<EpisodeDetailBloc>(
                create: (ctx) => EpisodeDetailBloc(
                    _navigationController,
                    LocalRepositoryImpl.instance(),
                    EpisodeRepositoryImpl.instance(),
                    CharacterRepositoryImpl.instance()),
                child: EpisodeDetailPage()),
        LocationsPage.routeName: (context) => BlocProvider<LocationBloc>(
            create: (ctx) => LocationBloc(
                _navigationController,
                LocationRepositoryImpl.instance(),
                LocalRepositoryImpl.instance()),
            child: LocationsPage()),
        LocationDetailPage.routeName: (context) =>
            BlocProvider<LocationDetailBloc>(
                create: (ctx) => LocationDetailBloc(
                    LocalRepositoryImpl.instance(),
                    LocationRepositoryImpl.instance()),
                child: LocationDetailPage()),
      },
    );
  }
}
