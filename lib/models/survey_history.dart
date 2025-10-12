import 'dart:convert';
import 'relaxation_area.dart';
import 'survey_models.dart';

class SurveyHistoryEntry {
  final String id;
  final DateTime timestamp;
  final Map<RelaxationType, double> scores;
  final Map<RelaxationType, RelaxationLevel> levels;
  final List<RelaxationType> deficitAreas;
  final double averageScore;
  final SurveyType surveyType;
  final RelaxationType? specializedArea;

  SurveyHistoryEntry({
    required this.id,
    required this.timestamp,
    required this.scores,
    required this.levels,
    required this.deficitAreas,
    required this.averageScore,
    this.surveyType = SurveyType.general,
    this.specializedArea,
  });

  // Factory Konstruktor zum Erstellen aus einem SurveyResult
  factory SurveyHistoryEntry.fromSurveyResult(SurveyResult result) {
    final averageScore = result.scores.values.isEmpty
        ? 0.0
        : result.scores.values.reduce((a, b) => a + b) / result.scores.length;

    return SurveyHistoryEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      scores: result.scores,
      levels: result.levels,
      deficitAreas: result.deficitAreas,
      averageScore: averageScore,
      surveyType: result.surveyType,
      specializedArea: result.specializedArea,
    );
  }

  // Serialisierung zu JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'scores': scores.map(
        (key, value) => MapEntry(key.toString().split('.').last, value),
      ),
      'levels': levels.map(
        (key, value) => MapEntry(
          key.toString().split('.').last,
          value.toString().split('.').last,
        ),
      ),
      'deficitAreas':
          deficitAreas.map((area) => area.toString().split('.').last).toList(),
      'averageScore': averageScore,
      'surveyType': surveyType.toString().split('.').last,
      'specializedArea': specializedArea?.toString().split('.').last,
    };
  }

  // Deserialisierung von JSON
  factory SurveyHistoryEntry.fromJson(Map<String, dynamic> json) {
    return SurveyHistoryEntry(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      scores: (json['scores'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          RelaxationType.values.firstWhere(
            (e) => e.toString().split('.').last == key,
          ),
          (value as num).toDouble(),
        ),
      ),
      levels: (json['levels'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          RelaxationType.values.firstWhere(
            (e) => e.toString().split('.').last == key,
          ),
          RelaxationLevel.values.firstWhere(
            (e) => e.toString().split('.').last == value,
          ),
        ),
      ),
      deficitAreas: (json['deficitAreas'] as List<dynamic>)
          .map((e) => RelaxationType.values.firstWhere(
                (type) => type.toString().split('.').last == e,
              ))
          .toList(),
      averageScore: (json['averageScore'] as num).toDouble(),
      surveyType: json['surveyType'] != null
          ? SurveyType.values.firstWhere(
              (e) => e.toString().split('.').last == json['surveyType'],
              orElse: () => SurveyType.general,
            )
          : SurveyType.general,
      specializedArea: json['specializedArea'] != null
          ? RelaxationType.values.firstWhere(
              (e) => e.toString().split('.').last == json['specializedArea'],
            )
          : null,
    );
  }

  String toJsonString() => json.encode(toJson());

  factory SurveyHistoryEntry.fromJsonString(String jsonString) =>
      SurveyHistoryEntry.fromJson(json.decode(jsonString));
}

class SurveyHistory {
  final List<SurveyHistoryEntry> entries;

  SurveyHistory({required this.entries});

  // Sortiert nach Datum (neueste zuerst)
  List<SurveyHistoryEntry> get sortedEntries {
    final sorted = List<SurveyHistoryEntry>.from(entries);
    sorted.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted;
  }

  // Holt die neueste Einträge (maxCount Anzahl)
  List<SurveyHistoryEntry> getRecent(int maxCount) {
    final sorted = sortedEntries;
    return sorted.take(maxCount).toList();
  }

  // Berechnet die Verbesserung im Vergleich zum letzten Eintrag
  Map<RelaxationType, double>? getImprovement() {
    if (entries.length < 2) return null;

    final sorted = sortedEntries;
    final latest = sorted[0];
    final previous = sorted[1];

    final improvements = <RelaxationType, double>{};
    for (final type in RelaxationType.values) {
      final latestScore = latest.scores[type] ?? 0;
      final previousScore = previous.scores[type] ?? 0;
      improvements[type] = latestScore - previousScore;
    }

    return improvements;
  }

  // Berechnet den durchschnittlichen Score über alle Einträge für einen Bereich
  Map<RelaxationType, double> getAverageScores() {
    if (entries.isEmpty) return {};

    final sums = <RelaxationType, double>{};
    final counts = <RelaxationType, int>{};

    for (final entry in entries) {
      for (final type in RelaxationType.values) {
        final score = entry.scores[type];
        if (score != null) {
          sums[type] = (sums[type] ?? 0) + score;
          counts[type] = (counts[type] ?? 0) + 1;
        }
      }
    }

    return sums.map((type, sum) {
      final count = counts[type] ?? 1;
      return MapEntry(type, sum / count);
    });
  }

  // Serialisierung zu JSON
  List<Map<String, dynamic>> toJson() {
    return entries.map((e) => e.toJson()).toList();
  }

  // Deserialisierung von JSON
  factory SurveyHistory.fromJson(List<dynamic> json) {
    return SurveyHistory(
      entries: json
          .map((e) => SurveyHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJsonString() => json.encode(toJson());

  factory SurveyHistory.fromJsonString(String jsonString) =>
      SurveyHistory.fromJson(json.decode(jsonString));
}
