// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'episode_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class EpisodeState extends Equatable {
  const EpisodeState(this._type);

  factory EpisodeState.loading() = Loading.create;

  factory EpisodeState.update({@required List<EpisodeResult> result}) =
      Update.create;

  factory EpisodeState.error({@required String error}) = Error.create;

  final _EpisodeState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _EpisodeState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function(Update) update,
      @required R Function(Error) error}) {
    assert(() {
      if (loading == null || update == null || error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeState.Loading:
        return loading();
      case _EpisodeState.Update:
        return update(this as Update);
      case _EpisodeState.Error:
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
      R Function(Error) error,
      @required R Function(EpisodeState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeState.Loading:
        if (loading == null) break;
        return loading();
      case _EpisodeState.Update:
        if (update == null) break;
        return update(this as Update);
      case _EpisodeState.Error:
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
      void Function(Error) error}) {
    assert(() {
      if (loading == null && update == null && error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeState.Loading:
        if (loading == null) break;
        return loading();
      case _EpisodeState.Update:
        if (update == null) break;
        return update(this as Update);
      case _EpisodeState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends EpisodeState {
  const Loading() : super(_EpisodeState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Update extends EpisodeState {
  const Update({@required this.result}) : super(_EpisodeState.Update);

  factory Update.create({@required List<EpisodeResult> result}) = _UpdateImpl;

  final List<EpisodeResult> result;

  /// Creates a copy of this Update but with the given fields
  /// replaced with the new values.
  Update copyWith({List<EpisodeResult> result});
}

@immutable
class _UpdateImpl extends Update {
  const _UpdateImpl({@required this.result}) : super(result: result);

  @override
  final List<EpisodeResult> result;

  @override
  _UpdateImpl copyWith({Object result = superEnum}) => _UpdateImpl(
        result:
            result == superEnum ? this.result : result as List<EpisodeResult>,
      );
  @override
  String toString() => 'Update(result: ${this.result})';
  @override
  List<Object> get props => [result];
}

@immutable
abstract class Error extends EpisodeState {
  const Error({@required this.error}) : super(_EpisodeState.Error);

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
