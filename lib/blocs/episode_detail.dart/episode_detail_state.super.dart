// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'episode_detail_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class EpisodeDetailState extends Equatable {
  const EpisodeDetailState(this._type);

  factory EpisodeDetailState.loading() = Loading.create;

  factory EpisodeDetailState.update(
      {@required EpisodeResult episodeResult,
      @required bool isOpenedBottomSheet}) = Update.create;

  factory EpisodeDetailState.showBottomSheet(
          {@required dynamic previousState,
          @required List<CharacterResult> characterDetailResults}) =
      ShowBottomSheet.create;

  factory EpisodeDetailState.error({@required String error}) = Error.create;

  final _EpisodeDetailState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _EpisodeDetailState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function(Update) update,
      @required R Function(ShowBottomSheet) showBottomSheet,
      @required R Function(Error) error}) {
    assert(() {
      if (loading == null ||
          update == null ||
          showBottomSheet == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailState.Loading:
        return loading();
      case _EpisodeDetailState.Update:
        return update(this as Update);
      case _EpisodeDetailState.ShowBottomSheet:
        return showBottomSheet(this as ShowBottomSheet);
      case _EpisodeDetailState.Error:
        return error(this as Error);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() loading,
      R Function(Update) update,
      R Function(ShowBottomSheet) showBottomSheet,
      R Function(Error) error,
      @required R Function(EpisodeDetailState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailState.Loading:
        if (loading == null) break;
        return loading();
      case _EpisodeDetailState.Update:
        if (update == null) break;
        return update(this as Update);
      case _EpisodeDetailState.ShowBottomSheet:
        if (showBottomSheet == null) break;
        return showBottomSheet(this as ShowBottomSheet);
      case _EpisodeDetailState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() loading,
      void Function(Update) update,
      void Function(ShowBottomSheet) showBottomSheet,
      void Function(Error) error}) {
    assert(() {
      if (loading == null &&
          update == null &&
          showBottomSheet == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailState.Loading:
        if (loading == null) break;
        return loading();
      case _EpisodeDetailState.Update:
        if (update == null) break;
        return update(this as Update);
      case _EpisodeDetailState.ShowBottomSheet:
        if (showBottomSheet == null) break;
        return showBottomSheet(this as ShowBottomSheet);
      case _EpisodeDetailState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends EpisodeDetailState {
  const Loading() : super(_EpisodeDetailState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Update extends EpisodeDetailState {
  const Update(
      {@required this.episodeResult, @required this.isOpenedBottomSheet})
      : super(_EpisodeDetailState.Update);

  factory Update.create(
      {@required EpisodeResult episodeResult,
      @required bool isOpenedBottomSheet}) = _UpdateImpl;

  final EpisodeResult episodeResult;

  final bool isOpenedBottomSheet;

  /// Creates a copy of this Update but with the given fields
  /// replaced with the new values.
  Update copyWith({EpisodeResult episodeResult, bool isOpenedBottomSheet});
}

@immutable
class _UpdateImpl extends Update {
  const _UpdateImpl(
      {@required this.episodeResult, @required this.isOpenedBottomSheet})
      : super(
            episodeResult: episodeResult,
            isOpenedBottomSheet: isOpenedBottomSheet);

  @override
  final EpisodeResult episodeResult;

  @override
  final bool isOpenedBottomSheet;

  @override
  _UpdateImpl copyWith(
          {Object episodeResult = superEnum,
          Object isOpenedBottomSheet = superEnum}) =>
      _UpdateImpl(
        episodeResult: episodeResult == superEnum
            ? this.episodeResult
            : episodeResult as EpisodeResult,
        isOpenedBottomSheet: isOpenedBottomSheet == superEnum
            ? this.isOpenedBottomSheet
            : isOpenedBottomSheet as bool,
      );
  @override
  String toString() =>
      'Update(episodeResult: ${this.episodeResult}, isOpenedBottomSheet: ${this.isOpenedBottomSheet})';
  @override
  List<Object> get props => [episodeResult, isOpenedBottomSheet];
}

@immutable
abstract class ShowBottomSheet extends EpisodeDetailState {
  const ShowBottomSheet(
      {@required this.previousState, @required this.characterDetailResults})
      : super(_EpisodeDetailState.ShowBottomSheet);

  factory ShowBottomSheet.create(
          {@required dynamic previousState,
          @required List<CharacterResult> characterDetailResults}) =
      _ShowBottomSheetImpl;

  final dynamic previousState;

  final List<CharacterResult> characterDetailResults;

  /// Creates a copy of this ShowBottomSheet but with the given fields
  /// replaced with the new values.
  ShowBottomSheet copyWith(
      {dynamic previousState, List<CharacterResult> characterDetailResults});
}

@immutable
class _ShowBottomSheetImpl extends ShowBottomSheet {
  const _ShowBottomSheetImpl(
      {@required this.previousState, @required this.characterDetailResults})
      : super(
            previousState: previousState,
            characterDetailResults: characterDetailResults);

  @override
  final dynamic previousState;

  @override
  final List<CharacterResult> characterDetailResults;

  @override
  _ShowBottomSheetImpl copyWith(
          {Object previousState = superEnum,
          Object characterDetailResults = superEnum}) =>
      _ShowBottomSheetImpl(
        previousState: previousState == superEnum
            ? this.previousState
            : previousState as dynamic,
        characterDetailResults: characterDetailResults == superEnum
            ? this.characterDetailResults
            : characterDetailResults as List<CharacterResult>,
      );
  @override
  String toString() =>
      'ShowBottomSheet(previousState: ${this.previousState}, characterDetailResults: ${this.characterDetailResults})';
  @override
  List<Object> get props => [previousState, characterDetailResults];
}

@immutable
abstract class Error extends EpisodeDetailState {
  const Error({@required this.error}) : super(_EpisodeDetailState.Error);

  factory Error.create({@required String error}) = _ErrorImpl;

  final String error;

  /// Creates a copy of this Error but with the given fields
  /// replaced with the new values.
  Error copyWith({String error});
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl({@required this.error}) : super(error: error);

  @override
  final String error;

  @override
  _ErrorImpl copyWith({Object error = superEnum}) => _ErrorImpl(
        error: error == superEnum ? this.error : error as String,
      );
  @override
  String toString() => 'Error(error: ${this.error})';
  @override
  List<Object> get props => [error];
}
