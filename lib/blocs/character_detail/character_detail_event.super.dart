// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'character_detail_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent(this._type);

  factory CharacterDetailEvent.start() = Start.create;

  factory CharacterDetailEvent.locationTapped() = LocationTapped.create;

  factory CharacterDetailEvent.episodeTapped() = EpisodeTapped.create;

  factory CharacterDetailEvent.repeatClicked() = RepeatClicked.create;

  final _CharacterDetailEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _CharacterDetailEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function() start,
      @required R Function() locationTapped,
      @required R Function() episodeTapped,
      @required R Function() repeatClicked}) {
    assert(() {
      if (start == null ||
          locationTapped == null ||
          episodeTapped == null ||
          repeatClicked == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterDetailEvent.Start:
        return start();
      case _CharacterDetailEvent.LocationTapped:
        return locationTapped();
      case _CharacterDetailEvent.EpisodeTapped:
        return episodeTapped();
      case _CharacterDetailEvent.RepeatClicked:
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
      R Function() locationTapped,
      R Function() episodeTapped,
      R Function() repeatClicked,
      @required R Function(CharacterDetailEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterDetailEvent.Start:
        if (start == null) break;
        return start();
      case _CharacterDetailEvent.LocationTapped:
        if (locationTapped == null) break;
        return locationTapped();
      case _CharacterDetailEvent.EpisodeTapped:
        if (episodeTapped == null) break;
        return episodeTapped();
      case _CharacterDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() start,
      void Function() locationTapped,
      void Function() episodeTapped,
      void Function() repeatClicked}) {
    assert(() {
      if (start == null &&
          locationTapped == null &&
          episodeTapped == null &&
          repeatClicked == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _CharacterDetailEvent.Start:
        if (start == null) break;
        return start();
      case _CharacterDetailEvent.LocationTapped:
        if (locationTapped == null) break;
        return locationTapped();
      case _CharacterDetailEvent.EpisodeTapped:
        if (episodeTapped == null) break;
        return episodeTapped();
      case _CharacterDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Start extends CharacterDetailEvent {
  const Start() : super(_CharacterDetailEvent.Start);

  factory Start.create() = _StartImpl;
}

@immutable
class _StartImpl extends Start {
  const _StartImpl() : super();

  @override
  String toString() => 'Start()';
}

@immutable
abstract class LocationTapped extends CharacterDetailEvent {
  const LocationTapped() : super(_CharacterDetailEvent.LocationTapped);

  factory LocationTapped.create() = _LocationTappedImpl;
}

@immutable
class _LocationTappedImpl extends LocationTapped {
  const _LocationTappedImpl() : super();

  @override
  String toString() => 'LocationTapped()';
}

@immutable
abstract class EpisodeTapped extends CharacterDetailEvent {
  const EpisodeTapped() : super(_CharacterDetailEvent.EpisodeTapped);

  factory EpisodeTapped.create() = _EpisodeTappedImpl;
}

@immutable
class _EpisodeTappedImpl extends EpisodeTapped {
  const _EpisodeTappedImpl() : super();

  @override
  String toString() => 'EpisodeTapped()';
}

@immutable
abstract class RepeatClicked extends CharacterDetailEvent {
  const RepeatClicked() : super(_CharacterDetailEvent.RepeatClicked);

  factory RepeatClicked.create() = _RepeatClickedImpl;
}

@immutable
class _RepeatClickedImpl extends RepeatClicked {
  const _RepeatClickedImpl() : super();

  @override
  String toString() => 'RepeatClicked()';
}
