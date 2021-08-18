// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'episode_detail_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class EpisodeDetailEvent extends Equatable {
  const EpisodeDetailEvent(this._type);

  factory EpisodeDetailEvent.start() = Start.create;

  factory EpisodeDetailEvent.repeatClicked() = RepeatClicked.create;

  factory EpisodeDetailEvent.characterWithEpisodeTapped() =
      CharacterWithEpisodeTapped.create;

  factory EpisodeDetailEvent.closedBottomSheet() = ClosedBottomSheet.create;

  factory EpisodeDetailEvent.itemBottomSheetClicked() =
      ItemBottomSheetClicked.create;

  final _EpisodeDetailEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _EpisodeDetailEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function() start,
      @required R Function() repeatClicked,
      @required R Function() characterWithEpisodeTapped,
      @required R Function() closedBottomSheet,
      @required R Function() itemBottomSheetClicked}) {
    assert(() {
      if (start == null ||
          repeatClicked == null ||
          characterWithEpisodeTapped == null ||
          closedBottomSheet == null ||
          itemBottomSheetClicked == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailEvent.Start:
        return start();
      case _EpisodeDetailEvent.RepeatClicked:
        return repeatClicked();
      case _EpisodeDetailEvent.CharacterWithEpisodeTapped:
        return characterWithEpisodeTapped();
      case _EpisodeDetailEvent.ClosedBottomSheet:
        return closedBottomSheet();
      case _EpisodeDetailEvent.ItemBottomSheetClicked:
        return itemBottomSheetClicked();
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
      R Function() characterWithEpisodeTapped,
      R Function() closedBottomSheet,
      R Function() itemBottomSheetClicked,
      @required R Function(EpisodeDetailEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailEvent.Start:
        if (start == null) break;
        return start();
      case _EpisodeDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
      case _EpisodeDetailEvent.CharacterWithEpisodeTapped:
        if (characterWithEpisodeTapped == null) break;
        return characterWithEpisodeTapped();
      case _EpisodeDetailEvent.ClosedBottomSheet:
        if (closedBottomSheet == null) break;
        return closedBottomSheet();
      case _EpisodeDetailEvent.ItemBottomSheetClicked:
        if (itemBottomSheetClicked == null) break;
        return itemBottomSheetClicked();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() start,
      void Function() repeatClicked,
      void Function() characterWithEpisodeTapped,
      void Function() closedBottomSheet,
      void Function() itemBottomSheetClicked}) {
    assert(() {
      if (start == null &&
          repeatClicked == null &&
          characterWithEpisodeTapped == null &&
          closedBottomSheet == null &&
          itemBottomSheetClicked == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _EpisodeDetailEvent.Start:
        if (start == null) break;
        return start();
      case _EpisodeDetailEvent.RepeatClicked:
        if (repeatClicked == null) break;
        return repeatClicked();
      case _EpisodeDetailEvent.CharacterWithEpisodeTapped:
        if (characterWithEpisodeTapped == null) break;
        return characterWithEpisodeTapped();
      case _EpisodeDetailEvent.ClosedBottomSheet:
        if (closedBottomSheet == null) break;
        return closedBottomSheet();
      case _EpisodeDetailEvent.ItemBottomSheetClicked:
        if (itemBottomSheetClicked == null) break;
        return itemBottomSheetClicked();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Start extends EpisodeDetailEvent {
  const Start() : super(_EpisodeDetailEvent.Start);

  factory Start.create() = _StartImpl;
}

@immutable
class _StartImpl extends Start {
  const _StartImpl() : super();

  @override
  String toString() => 'Start()';
}

@immutable
abstract class RepeatClicked extends EpisodeDetailEvent {
  const RepeatClicked() : super(_EpisodeDetailEvent.RepeatClicked);

  factory RepeatClicked.create() = _RepeatClickedImpl;
}

@immutable
class _RepeatClickedImpl extends RepeatClicked {
  const _RepeatClickedImpl() : super();

  @override
  String toString() => 'RepeatClicked()';
}

@immutable
abstract class CharacterWithEpisodeTapped extends EpisodeDetailEvent {
  const CharacterWithEpisodeTapped()
      : super(_EpisodeDetailEvent.CharacterWithEpisodeTapped);

  factory CharacterWithEpisodeTapped.create() = _CharacterWithEpisodeTappedImpl;
}

@immutable
class _CharacterWithEpisodeTappedImpl extends CharacterWithEpisodeTapped {
  const _CharacterWithEpisodeTappedImpl() : super();

  @override
  String toString() => 'CharacterWithEpisodeTapped()';
}

@immutable
abstract class ClosedBottomSheet extends EpisodeDetailEvent {
  const ClosedBottomSheet() : super(_EpisodeDetailEvent.ClosedBottomSheet);

  factory ClosedBottomSheet.create() = _ClosedBottomSheetImpl;
}

@immutable
class _ClosedBottomSheetImpl extends ClosedBottomSheet {
  const _ClosedBottomSheetImpl() : super();

  @override
  String toString() => 'ClosedBottomSheet()';
}

@immutable
abstract class ItemBottomSheetClicked extends EpisodeDetailEvent {
  const ItemBottomSheetClicked()
      : super(_EpisodeDetailEvent.ItemBottomSheetClicked);

  factory ItemBottomSheetClicked.create() = _ItemBottomSheetClickedImpl;
}

@immutable
class _ItemBottomSheetClickedImpl extends ItemBottomSheetClicked {
  const _ItemBottomSheetClickedImpl() : super();

  @override
  String toString() => 'ItemBottomSheetClicked()';
}
