import 'package:flutter/foundation.dart';
import '../models/survey_models.dart';
import '../models/relaxation_area.dart';
import '../data/specialized_survey_questions.dart';
import '../services/history_storage_service.dart';

class SpecializedSurveyProvider extends ChangeNotifier {
  final HistoryStorageService _historyService = HistoryStorageService();
  final RelaxationType _targetArea;
  final List<QuestionAnswer> _answers = [];
  int _currentQuestionIndex = 0;
  SurveyResult? _result;

  SpecializedSurveyProvider(this._targetArea);

  RelaxationType get targetArea => _targetArea;
  List<QuestionAnswer> get answers => _answers;
  int get currentQuestionIndex => _currentQuestionIndex;
  SurveyResult? get result => _result;

  List<Question> get questions =>
      SpecializedSurveyQuestions.getSpecializedQuestions(_targetArea);
  Question get currentQuestion => questions[_currentQuestionIndex];
  bool get hasNextQuestion => _currentQuestionIndex < questions.length - 1;
  bool get isCompleted => _currentQuestionIndex >= questions.length;

  void answerQuestion(int answerIndex) {
    final question = currentQuestion;

    // Entferne vorherige Antwort auf diese Frage, falls vorhanden
    _answers.removeWhere((answer) => answer.questionId == question.id);

    // Füge neue Antwort hinzu
    _answers.add(QuestionAnswer(
      questionId: question.id,
      answerIndex: answerIndex,
      relatedArea: question.relatedArea,
    ));

    notifyListeners();
  }

  void nextQuestion() {
    if (hasNextQuestion) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      _calculateResult();
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void _calculateResult() {
    // Berechne Scores für Unterkategorien
    final Map<String, List<int>> subCategoryScoresMap = {};

    for (final answer in _answers) {
      final question = questions.firstWhere((q) => q.id == answer.questionId);
      final subCategory = question.subCategory ?? 'general';

      subCategoryScoresMap.putIfAbsent(subCategory, () => []);
      subCategoryScoresMap[subCategory]!.add(answer.score);
    }

    // Berechne durchschnittliche Scores für jede Unterkategorie
    final Map<String, double> subCategoryScores = {};
    for (final entry in subCategoryScoresMap.entries) {
      final averageScore =
          entry.value.reduce((a, b) => a + b) / entry.value.length;
      final percentage = (averageScore / 4.0) * 100;
      subCategoryScores[entry.key] = percentage;
    }

    // Berechne Gesamtscore für die Kategorie
    final totalScore = _answers.isEmpty
        ? 0.0
        : (_answers.map((a) => a.score).reduce((a, b) => a + b) /
                _answers.length) /
            4.0 *
            100;

    final level = _getRelaxationLevel(totalScore);
    final hasDeficit = totalScore < 60;

    _result = SurveyResult(
      scores: {_targetArea: totalScore},
      levels: {_targetArea: level},
      deficitAreas: hasDeficit ? [_targetArea] : [],
      surveyType: SurveyType.specialized,
      specializedArea: _targetArea,
      subCategoryScores: subCategoryScores,
    );

    // Speichere das Ergebnis im Verlauf
    _historyService.saveResult(_result!);
  }

  RelaxationLevel _getRelaxationLevel(double percentage) {
    if (percentage >= 80) return RelaxationLevel.excellent;
    if (percentage >= 60) return RelaxationLevel.good;
    if (percentage >= 40) return RelaxationLevel.moderate;
    if (percentage >= 20) return RelaxationLevel.poor;
    return RelaxationLevel.critical;
  }

  void reset() {
    _answers.clear();
    _currentQuestionIndex = 0;
    _result = null;
    notifyListeners();
  }

  bool isQuestionAnswered(String questionId) {
    return _answers.any((answer) => answer.questionId == questionId);
  }

  int? getAnswerForQuestion(String questionId) {
    final answer =
        _answers.where((answer) => answer.questionId == questionId).firstOrNull;
    return answer?.answerIndex;
  }

  // Hilfsmethode zum Abrufen von Unterkategorienamen
  String getSubCategoryDisplayName(String subCategory) {
    final names = {
      // Körperlich
      'flexibility': 'Beweglichkeit',
      'tension': 'Muskelverspannungen',
      'posture': 'Körperhaltung',
      'activity_level': 'Aktivitätslevel',
      'sleep': 'Schlafqualität',
      'energy': 'Energielevel',
      'stretching': 'Dehnung',
      'awareness': 'Körperbewusstsein',

      // Mental
      'rumination': 'Gedankenkreisen',
      'evening_relaxation': 'Abendliche Entspannung',
      'digital_distraction': 'Digitale Ablenkung',
      'focus': 'Fokus',
      'breaks': 'Pausen',
      'breathing': 'Atemübungen',
      'cognitive_function': 'Kognitive Funktion',
      'mental_breaks': 'Mentale Auszeiten',

      // Emotional
      'emotional_regulation': 'Emotionsregulation',
      'emotional_awareness': 'Emotionales Bewusstsein',
      'coping': 'Bewältigungsstrategien',
      'support': 'Soziale Unterstützung',
      'overwhelm': 'Emotionale Überforderung',
      'self_compassion': 'Selbstmitgefühl',
      'journaling': 'Journaling',
      'resilience': 'Resilienz',

      // Sozial
      'group_comfort': 'Wohlfühlen in Gruppen',
      'boundaries': 'Grenzen',
      'recharge': 'Aufladen',
      'acceptance': 'Akzeptanz',
      'conflicts': 'Konflikte',
      'authenticity': 'Authentizität',
      'quality_time': 'Qualitätszeit',
      'boundary_setting': 'Grenzen setzen',

      // Spirituell
      'connection': 'Verbindung',
      'nature': 'Natur',
      'meaning': 'Lebenssinn',
      'gratitude': 'Dankbarkeit',
      'practices': 'Spirituelle Praktiken',
      'values': 'Werte',
      'silence': 'Stille',
      'awe': 'Ehrfurcht',

      // Sensorisch
      'sound_sensitivity': 'Geräuschempfindlichkeit',
      'smell': 'Geruchssinn',
      'light_sensitivity': 'Lichtempfindlichkeit',
      'touch': 'Tastsinn',
      'sound_therapy': 'Klangtherapie',
      'sensory_indulgence': 'Sensorische Verwöhnung',
      'overstimulation': 'Reizüberflutung',
      'taste': 'Geschmackssinn',

      // Kreativ
      'flow': 'Flow-Zustand',
      'spontaneity': 'Spontanität',
      'creative_space': 'Kreativer Raum',
      'perfectionism': 'Perfektionismus',
      'variety': 'Vielfalt',
      'emotional_expression': 'Emotionaler Ausdruck',
      'hands_on': 'Handarbeit',
      'sharing': 'Teilen',
    };

    return names[subCategory] ?? subCategory;
  }
}

extension FirstOrNullExtension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      return iterator.current;
    }
    return null;
  }
}
