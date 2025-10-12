import 'relaxation_area.dart';

enum SurveyType {
  general, // Allgemeiner Fragebogen (21 Fragen)
  specialized, // Spezialisierter Fragebogen für eine Kategorie
}

class Question {
  final String id;
  final String question;
  final RelaxationType relatedArea;
  final List<String> options;
  final SurveyType surveyType;
  final String?
      subCategory; // Für spezialisierte Fragen, um Unterkategorien zu identifizieren

  const Question({
    required this.id,
    required this.question,
    required this.relatedArea,
    required this.options,
    this.surveyType = SurveyType.general,
    this.subCategory,
  });
}

class QuestionAnswer {
  final String questionId;
  final int answerIndex;
  final RelaxationType relatedArea;

  const QuestionAnswer({
    required this.questionId,
    required this.answerIndex,
    required this.relatedArea,
  });

  // Konvertiert die Antwort in einen Punktewert (0-4)
  int get score => answerIndex;
}

class SurveyResult {
  final Map<RelaxationType, double> scores;
  final Map<RelaxationType, RelaxationLevel> levels;
  final List<RelaxationType> deficitAreas;
  final SurveyType surveyType;
  final RelaxationType?
      specializedArea; // Wenn spezialisiert, für welche Kategorie
  final Map<String, double>?
      subCategoryScores; // Scores für Unterkategorien bei spezialisierten Umfragen

  SurveyResult({
    required this.scores,
    required this.levels,
    required this.deficitAreas,
    this.surveyType = SurveyType.general,
    this.specializedArea,
    this.subCategoryScores,
  });
}

enum RelaxationLevel {
  excellent, // 80-100%
  good, // 60-80%
  moderate, // 40-60%
  poor, // 20-40%
  critical, // 0-20%
}

extension RelaxationLevelExtension on RelaxationLevel {
  String get displayName {
    switch (this) {
      case RelaxationLevel.excellent:
        return 'Ausgezeichnet';
      case RelaxationLevel.good:
        return 'Gut';
      case RelaxationLevel.moderate:
        return 'Mittelmäßig';
      case RelaxationLevel.poor:
        return 'Verbesserungsbedürftig';
      case RelaxationLevel.critical:
        return 'Kritisch';
    }
  }

  String get description {
    switch (this) {
      case RelaxationLevel.excellent:
        return 'Sie sind in diesem Bereich sehr gut entspannt!';
      case RelaxationLevel.good:
        return 'Sie haben eine gute Balance in diesem Bereich.';
      case RelaxationLevel.moderate:
        return 'Es gibt Verbesserungspotential in diesem Bereich.';
      case RelaxationLevel.poor:
        return 'Dieser Bereich benötigt Aufmerksamkeit.';
      case RelaxationLevel.critical:
        return 'Dieser Bereich sollte dringend angegangen werden.';
    }
  }
}
