// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'location_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LocationState extends Equatable {
  const LocationState(this._type);

  factory LocationState.loading() = Loading.create;

  factory LocationState.loaded(
      {@required Info info,
      @required List<LocationResult> result,
      @required EasyRefreshController refreshController}) = Loaded.create;

  factory LocationState.update(
      {@required Info info,
      @required List<LocationResult> result,
      @required EasyRefreshController refreshController}) = Update.create;

  factory LocationState.error({@required String error}) = Error.create;

  final _LocationState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LocationState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function(Loaded) loaded,
      @required R Function(Update) update,
      @required R Function(Error) error}) {
    assert(() {
      if (loading == null ||
          loaded == null ||
          update == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationState.Loading:
        return loading();
      case _LocationState.Loaded:
        return loaded(this as Loaded);
      case _LocationState.Update:
        return update(this as Update);
      case _LocationState.Error:
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
      R Function(Loaded) loaded,
      R Function(Update) update,
      R Function(Error) error,
      @required R Function(LocationState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationState.Loading:
        if (loading == null) break;
        return loading();
      case _LocationState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _LocationState.Update:
        if (update == null) break;
        return update(this as Update);
      case _LocationState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() loading,
      void Function(Loaded) loaded,
      void Function(Update) update,
      void Function(Error) error}) {
    assert(() {
      if (loading == null &&
          loaded == null &&
          update == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationState.Loading:
        if (loading == null) break;
        return loading();
      case _LocationState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _LocationState.Update:
        if (update == null) break;
        return update(this as Update);
      case _LocationState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends LocationState {
  const Loading() : super(_LocationState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Loaded extends LocationState {
  const Loaded(
      {@required this.info,
      @required this.result,
      @required this.refreshController})
      : super(_LocationState.Loaded);

  factory Loaded.create(
      {@required Info info,
      @required List<LocationResult> result,
      @required EasyRefreshController refreshController}) = _LoadedImpl;

  final Info info;

  final List<LocationResult> result;

  final EasyRefreshController refreshController;

  /// Creates a copy of this Loaded but with the given fields
  /// replaced with the new values.
  Loaded copyWith(
      {Info info,
      List<LocationResult> result,
      EasyRefreshController refreshController});
}

@immutable
class _LoadedImpl extends Loaded {
  const _LoadedImpl(
      {@required this.info,
      @required this.result,
      @required this.refreshController})
      : super(info: info, result: result, refreshController: refreshController);

  @override
  final Info info;

  @override
  final List<LocationResult> result;

  @override
  final EasyRefreshController refreshController;

  @override
  _LoadedImpl copyWith(
          {Object info = superEnum,
          Object result = superEnum,
          Object refreshController = superEnum}) =>
      _LoadedImpl(
        info: info == superEnum ? this.info : info as Info,
        result:
            result == superEnum ? this.result : result as List<LocationResult>,
        refreshController: refreshController == superEnum
            ? this.refreshController
            : refreshController as EasyRefreshController,
      );
  @override
  String toString() =>
      'Loaded(info: ${this.info}, result: ${this.result}, refreshController: ${this.refreshController})';
  @override
  List<Object> get props => [info, result, refreshController];
}

@immutable
abstract class Update extends LocationState {
  const Update(
      {@required this.info,
      @required this.result,
      @required this.refreshController})
      : super(_LocationState.Update);

  factory Update.create(
      {@required Info info,
      @required List<LocationResult> result,
      @required EasyRefreshController refreshController}) = _UpdateImpl;

  final Info info;

  final List<LocationResult> result;

  final EasyRefreshController refreshController;

  /// Creates a copy of this Update but with the given fields
  /// replaced with the new values.
  Update copyWith(
      {Info info,
      List<LocationResult> result,
      EasyRefreshController refreshController});
}

@immutable
class _UpdateImpl extends Update {
  const _UpdateImpl(
      {@required this.info,
      @required this.result,
      @required this.refreshController})
      : super(info: info, result: result, refreshController: refreshController);

  @override
  final Info info;

  @override
  final List<LocationResult> result;

  @override
  final EasyRefreshController refreshController;

  @override
  _UpdateImpl copyWith(
          {Object info = superEnum,
          Object result = superEnum,
          Object refreshController = superEnum}) =>
      _UpdateImpl(
        info: info == superEnum ? this.info : info as Info,
        result:
            result == superEnum ? this.result : result as List<LocationResult>,
        refreshController: refreshController == superEnum
            ? this.refreshController
            : refreshController as EasyRefreshController,
      );
  @override
  String toString() =>
      'Update(info: ${this.info}, result: ${this.result}, refreshController: ${this.refreshController})';
  @override
  List<Object> get props => [info, result, refreshController];
}

@immutable
abstract class Error extends LocationState {
  const Error({@required this.error}) : super(_LocationState.Error);

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
