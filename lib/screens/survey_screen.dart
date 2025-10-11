import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/survey_provider.dart';
import '../theme/app_theme.dart';
import '../models/relaxation_area.dart';
import 'result_screen.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entspannungstest'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<SurveyProvider>(
          builder: (context, provider, child) {
            if (provider.isCompleted && provider.result != null) {
              // Navigiere automatisch zum Ergebnis-Screen
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(),
                  ),
                );
              });
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Progress Bar
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Frage ${provider.currentQuestionIndex + 1} von ${provider.questions.length}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '${((provider.currentQuestionIndex + 1) / provider.questions.length * 100).round()}%',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (provider.currentQuestionIndex + 1) /
                            provider.questions.length,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppTheme.primaryColor),
                      ),
                    ],
                  ),
                ),

                // Question Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Entspannungsart Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getAreaColor(
                                provider.currentQuestion.relatedArea),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _getAreaEmoji(
                                    provider.currentQuestion.relatedArea),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _getAreaName(
                                    provider.currentQuestion.relatedArea),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Frage
                        Text(
                          provider.currentQuestion.question,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),

                        const SizedBox(height: 32),

                        // Antwortmöglichkeiten
                        ...provider.currentQuestion.options
                            .asMap()
                            .entries
                            .map((entry) {
                          final index = entry.key;
                          final option = entry.value;
                          final isSelected = provider.getAnswerForQuestion(
                                  provider.currentQuestion.id) ==
                              index;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => provider.answerQuestion(index),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppTheme.primaryColor
                                            .withValues(alpha: 0.1)
                                        : Colors.white,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppTheme.primaryColor
                                          : Colors.grey[300]!,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.05),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? AppTheme.primaryColor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: isSelected
                                                ? AppTheme.primaryColor
                                                : Colors.grey[400]!,
                                          ),
                                        ),
                                        child: isSelected
                                            ? const Icon(
                                                Icons.check,
                                                size: 16,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: isSelected
                                                ? FontWeight.w500
                                                : FontWeight.normal,
                                            color: isSelected
                                                ? AppTheme.primaryColor
                                                : AppTheme.textPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                // Navigation Buttons
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      if (provider.currentQuestionIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: provider.previousQuestion,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Zurück'),
                          ),
                        ),
                      if (provider.currentQuestionIndex > 0)
                        const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: provider.isQuestionAnswered(
                                  provider.currentQuestion.id)
                              ? provider.nextQuestion
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            provider.hasNextQuestion ? 'Weiter' : 'Auswertung',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getAreaColor(RelaxationType type) {
    switch (type) {
      case RelaxationType.physical:
        return AppTheme.physicalColor;
      case RelaxationType.mental:
        return AppTheme.mentalColor;
      case RelaxationType.emotional:
        return AppTheme.emotionalColor;
      case RelaxationType.social:
        return AppTheme.socialColor;
      case RelaxationType.spiritual:
        return AppTheme.spiritualColor;
      case RelaxationType.sensory:
        return AppTheme.sensoryColor;
      case RelaxationType.creative:
        return AppTheme.creativeColor;
    }
  }

  String _getAreaEmoji(RelaxationType type) {
    final area = RelaxationArea.getByType(type);
    return area.icon;
  }

  String _getAreaName(RelaxationType type) {
    final area = RelaxationArea.getByType(type);
    return area.name;
  }
}
