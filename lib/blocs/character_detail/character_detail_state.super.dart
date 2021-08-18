// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'character_detail_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CharacterDetailState extends Equatable {
  const CharacterDetailState(this._type);

  factory CharacterDetailState.loading() = Loading.create;

  factory CharacterDetailState.update({@required CharacterResult result}) =
      Update.create;

  factory CharacterDetailState.error({@required String error}) = Error.create;

  final _CharacterDetailState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _CharacterDetailState [_type]s defined.
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
      case _CharacterDetailState.Loading:
        return loading();
      case _CharacterDetailState.Update:
        return update(this as Update);
      case _CharacterDetailState.Error:
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
      @required R Function(CharacterDetailState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterDetailState.Loading:
        if (loading == null) break;
        return loading();
      case _CharacterDetailState.Update:
        if (update == null) break;
        return update(this as Update);
      case _CharacterDetailState.Error:
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
      case _CharacterDetailState.Loading:
        if (loading == null) break;
        return loading();
      case _CharacterDetailState.Update:
        if (update == null) break;
        return update(this as Update);
      case _CharacterDetailState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends CharacterDetailState {
  const Loading() : super(_CharacterDetailState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Update extends CharacterDetailState {
  const Update({@required this.result}) : super(_CharacterDetailState.Update);

  factory Update.create({@required CharacterResult result}) = _UpdateImpl;

  final CharacterResult result;

  /// Creates a copy of this Update but with the given fields
  /// replaced with the new values.
  Update copyWith({CharacterResult result});
}

@immutable
class _UpdateImpl extends Update {
  const _UpdateImpl({@required this.result}) : super(result: result);

  @override
  final CharacterResult result;

  @override
  _UpdateImpl copyWith({Object result = superEnum}) => _UpdateImpl(
        result: result == superEnum ? this.result : result as CharacterResult,
      );
  @override
  String toString() => 'Update(result: ${this.result})';
  @override
  List<Object> get props => [result];
}

@immutable
abstract class Error extends CharacterDetailState {
  const Error({@required this.error}) : super(_CharacterDetailState.Error);

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
