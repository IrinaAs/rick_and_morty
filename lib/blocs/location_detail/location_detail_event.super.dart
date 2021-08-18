// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'location_detail_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LocationDetailEvent extends Equatable {
  const LocationDetailEvent(this._type);

  factory LocationDetailEvent.start() = Start.create;

  factory LocationDetailEvent.repeatClicked() = RepeatClicked.create;

  factory LocationDetailEvent.characterWithLocationTapped() =
      CharacterWithLocationTapped.create;

  final _LocationDetailEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LocationDetailEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function() start,
      @required R Function() repeatClicked,
      @required R Function() characterWithLocationTapped}) {
    assert(() {
      if (start == null ||
          repeatClicked == null ||
          characterWithLocationTapped == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationDetailEvent.Start:
        return start();
      case _LocationDetailEvent.RepeatClicked:
        return repeatClicked();
      case _LocationDetailEvent.CharacterWithLocationTapped:
        return characterWithLocationTapped();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() start,
      R Function() repeatClicked,
      R Function() characterWithLocationTapped,
      @required R Function(LocationDetailEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationDetailEvent.Start:
        if (start == null) break;
        return start();
      case _LocationDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
      case _LocationDetailEvent.CharacterWithLocationTapped:
        if (characterWithLocationTapped == null) break;
        return characterWithLocationTapped();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() start,
      void Function() repeatClicked,
      void Function() characterWithLocationTapped}) {
    assert(() {
      if (start == null &&
          repeatClicked == null &&
          characterWithLocationTapped == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LocationDetailEvent.Start:
        if (start == null) break;
        return start();
      case _LocationDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
      case _LocationDetailEvent.CharacterWithLocationTapped:
        if (characterWithLocationTapped == null) break;
        return characterWithLocationTapped();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Start extends LocationDetailEvent {
  const Start() : super(_LocationDetailEvent.Start);

  factory Start.create() = _StartImpl;
}

@immutable
class _StartImpl extends Start {
  const _StartImpl() : super();

  @override
  String toString() => 'Start()';
}

@immutable
abstract class RepeatClicked extends LocationDetailEvent {
  const RepeatClicked() : super(_LocationDetailEvent.RepeatClicked);

  factory RepeatClicked.create() = _RepeatClickedImpl;
}

@immutable
class _RepeatClickedImpl extends RepeatClicked {
  const _RepeatClickedImpl() : super();

  @override
  String toString() => 'RepeatClicked()';
}

@immutable
abstract class CharacterWithLocationTapped extends LocationDetailEvent {
  const CharacterWithLocationTapped()
      : super(_LocationDetailEvent.CharacterWithLocationTapped);

  factory CharacterWithLocationTapped.create() =
      _CharacterWithLocationTappedImpl;
}

@immutable
class _CharacterWithLocationTappedImpl extends CharacterWithLocationTapped {
  const _CharacterWithLocationTappedImpl() : super();

  @override
  String toString() => 'CharacterWithLocationTapped()';
}
