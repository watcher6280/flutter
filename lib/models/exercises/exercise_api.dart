import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wger/models/exercises/category.dart';
import 'package:wger/models/exercises/equipment.dart';
import 'package:wger/models/exercises/image.dart';
import 'package:wger/models/exercises/muscle.dart';
import 'package:wger/models/exercises/translation.dart';
import 'package:wger/models/exercises/video.dart';

part 'exercise_api.freezed.dart';
part 'exercise_api.g.dart';

/// Model for an exercise as returned from the exercisebaseinfo endpoint
///
/// Basically this is just used as a convenience to create "real" exercise
/// objects and nothing more
@freezed
class ExerciseApiData with _$ExerciseApiData {
  factory ExerciseApiData({
    required int id,
    required String uuid,
    // ignore: invalid_annotation_target
    @Default(null) @JsonKey(name: 'variations') int? variationId,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created') required DateTime created,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_update') required DateTime lastUpdate,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_update_global') required DateTime lastUpdateGlobal,
    required ExerciseCategory category,
    required List<Muscle> muscles,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'muscles_secondary') required List<Muscle> musclesSecondary,
    // ignore: invalid_annotation_target
    required List<Equipment> equipment,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'exercises') required List<Translation> translations,
    required List<ExerciseImage> images,
    required List<Video> videos,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'author_history') required List<String> authors,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'total_authors_history') required List<String> authorsGlobal,
  }) = _ExerciseBaseData;

  factory ExerciseApiData.fromString(String input) => _$ExerciseApiDataFromJson(json.decode(input));

  factory ExerciseApiData.fromJson(Map<String, dynamic> json) => _$ExerciseApiDataFromJson(json);
}
