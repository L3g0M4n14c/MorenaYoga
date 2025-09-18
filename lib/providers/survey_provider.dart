import 'package:flutter/foundation.dart';
import '../models/survey_models.dart';
import '../models/relaxation_area.dart';
import '../data/survey_questions.dart';

class SurveyProvider extends ChangeNotifier {
  final List<QuestionAnswer> _answers = [];
  int _currentQuestionIndex = 0;
  SurveyResult? _result;

  List<QuestionAnswer> get answers => _answers;
  int get currentQuestionIndex => _currentQuestionIndex;
  SurveyResult? get result => _result;

  List<Question> get questions => SurveyQuestions.questions;
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
    } else {
      _calculateResult();
    }
    notifyListeners();
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void _calculateResult() {
    final Map<RelaxationType, List<int>> areaScores = {};

    // Sammle Punkte für jede Entspannungsart
    for (final answer in _answers) {
      areaScores.putIfAbsent(answer.relatedArea, () => []);
      areaScores[answer.relatedArea]!.add(answer.score);
    }

    // Berechne Durchschnittswerte und Level
    final Map<RelaxationType, double> scores = {};
    final Map<RelaxationType, RelaxationLevel> levels = {};
    final List<RelaxationType> deficitAreas = [];

    for (final area in RelaxationType.values) {
      final areaScoreList = areaScores[area] ?? [];
      if (areaScoreList.isNotEmpty) {
        final averageScore =
            areaScoreList.reduce((a, b) => a + b) / areaScoreList.length;
        final percentage = (averageScore / 4.0) * 100; // 4 ist max Score

        scores[area] = percentage;
        levels[area] = _getRelaxationLevel(percentage);

        // Defizitbereich wenn unter 60%
        if (percentage < 60) {
          deficitAreas.add(area);
        }
      }
    }

    _result = SurveyResult(
      scores: scores,
      levels: levels,
      deficitAreas: deficitAreas,
    );
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
