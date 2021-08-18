// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'character_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CharacterEvent extends Equatable {
  const CharacterEvent(this._type);

  factory CharacterEvent.start() = Start.create;

  factory CharacterEvent.itemClicked({@required int index}) =
      ItemClicked.create;

  factory CharacterEvent.pagination() = Pagination.create;

  factory CharacterEvent.refresh() = Refresh.create;

  factory CharacterEvent.repeatClicked() = RepeatClicked.create;

  final _CharacterEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _CharacterEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function() start,
      @required R Function(ItemClicked) itemClicked,
      @required R Function() pagination,
      @required R Function() refresh,
      @required R Function() repeatClicked}) {
    assert(() {
      if (start == null ||
          itemClicked == null ||
          pagination == null ||
          refresh == null ||
          repeatClicked == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterEvent.Start:
        return start();
      case _CharacterEvent.ItemClicked:
        return itemClicked(this as ItemClicked);
      case _CharacterEvent.Pagination:
        return pagination();
      case _CharacterEvent.Refresh:
        return refresh();
      case _CharacterEvent.RepeatClicked:
        return repeatClicked();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() start,
      R Function(ItemClicked) itemClicked,
      R Function() pagination,
      R Function() refresh,
      R Function() repeatClicked,
      @required R Function(CharacterEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterEvent.Start:
        if (start == null) break;
        return start();
      case _CharacterEvent.ItemClicked:
        if (itemClicked == null) break;
        return itemClicked(this as ItemClicked);
      case _CharacterEvent.Pagination:
        if (pagination == null) break;
        return pagination();
      case _CharacterEvent.Refresh:
        if (refresh == null) break;
        return refresh();
      case _CharacterEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() start,
      void Function(ItemClicked) itemClicked,
      void Function() pagination,
      void Function() refresh,
      void Function() repeatClicked}) {
    assert(() {
      if (start == null &&
          itemClicked == null &&
          pagination == null &&
          refresh == null &&
          repeatClicked == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterEvent.Start:
        if (start == null) break;
        return start();
      case _CharacterEvent.ItemClicked:
        if (itemClicked == null) break;
        return itemClicked(this as ItemClicked);
      case _CharacterEvent.Pagination:
        if (pagination == null) break;
        return pagination();
      case _CharacterEvent.Refresh:
        if (refresh == null) break;
        return refresh();
      case _CharacterEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Start extends CharacterEvent {
  const Start() : super(_CharacterEvent.Start);

  factory Start.create() = _StartImpl;
}

@immutable
class _StartImpl extends Start {
  const _StartImpl() : super();

  @override
  String toString() => 'Start()';
}

@immutable
abstract class ItemClicked extends CharacterEvent {
  const ItemClicked({@required this.index})
      : super(_CharacterEvent.ItemClicked);

  factory ItemClicked.create({@required int index}) = _ItemClickedImpl;

  final int index;

  /// Creates a copy of this ItemClicked but with the given fields
  /// replaced with the new values.
  ItemClicked copyWith({int index});
}

@immutable
class _ItemClickedImpl extends ItemClicked {
  const _ItemClickedImpl({@required this.index}) : super(index: index);

  @override
  final int index;

  @override
  _ItemClickedImpl copyWith({Object index = superEnum}) => _ItemClickedImpl(
        index: index == superEnum ? this.index : index as int,
      );
  @override
  String toString() => 'ItemClicked(index: ${this.index})';
  @override
  List<Object> get props => [index];
}

@immutable
abstract class Pagination extends CharacterEvent {
  const Pagination() : super(_CharacterEvent.Pagination);

  factory Pagination.create() = _PaginationImpl;
}

@immutable
class _PaginationImpl extends Pagination {
  const _PaginationImpl() : super();

  @override
  String toString() => 'Pagination()';
}

@immutable
abstract class Refresh extends CharacterEvent {
  const Refresh() : super(_CharacterEvent.Refresh);

  factory Refresh.create() = _RefreshImpl;
}

@immutable
class _RefreshImpl extends Refresh {
  const _RefreshImpl() : super();

  @override
  String toString() => 'Refresh()';
}

@immutable
abstract class RepeatClicked extends CharacterEvent {
  const RepeatClicked() : super(_CharacterEvent.RepeatClicked);

  factory RepeatClicked.create() = _RepeatClickedImpl;
}

@immutable
class _RepeatClickedImpl extends RepeatClicked {
  const _RepeatClickedImpl() : super();

  @override
  String toString() => 'RepeatClicked()';
}
