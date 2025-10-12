import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/specialized_survey_provider.dart';
import '../models/relaxation_area.dart';
import '../theme/app_theme.dart';
import 'specialized_result_screen.dart';

class SpecializedSurveyScreen extends StatelessWidget {
  final RelaxationType targetArea;

  const SpecializedSurveyScreen({
    super.key,
    required this.targetArea,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpecializedSurveyProvider(targetArea),
      child: const _SpecializedSurveyContent(),
    );
  }
}

class _SpecializedSurveyContent extends StatelessWidget {
  const _SpecializedSurveyContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spezialisierter Fragebogen'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Consumer<SpecializedSurveyProvider>(
          builder: (context, provider, child) {
            if (provider.isCompleted) {
              // Navigiere zum Ergebnis-Screen
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SpecializedResultScreen(
                      result: provider.result!,
                      provider: provider,
                    ),
                  ),
                );
              });
              return const Center(child: CircularProgressIndicator());
            }

            final question = provider.currentQuestion;
            final progress =
                (provider.currentQuestionIndex + 1) / provider.questions.length;
            final area = RelaxationArea.getByType(provider.targetArea);
            final color = _getAreaColor(provider.targetArea);
            final currentAnswer = provider.getAnswerForQuestion(question.id);

            return Column(
              children: [
                // Fortschrittsanzeige
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              area.icon,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  area.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                                Text(
                                  'Frage ${provider.currentQuestionIndex + 1} von ${provider.questions.length}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),

                // Frage und Antworten
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Frage
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                color.withValues(alpha: 0.1),
                                color.withValues(alpha: 0.05),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: color.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            question.question,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Antwortoptionen
                        ...List.generate(
                          question.options.length,
                          (index) {
                            final option = question.options[index];
                            final isSelected = currentAnswer == index;

                            return _buildAnswerOption(
                              context,
                              option,
                              index,
                              isSelected,
                              color,
                              () {
                                provider.answerQuestion(index);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Navigation
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      if (provider.currentQuestionIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              provider.previousQuestion();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(color: color),
                            ),
                            child: const Text('Zurück'),
                          ),
                        ),
                      if (provider.currentQuestionIndex > 0)
                        const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: currentAnswer != null
                              ? () {
                                  provider.nextQuestion();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            disabledBackgroundColor: Colors.grey[300],
                          ),
                          child: Text(
                            provider.hasNextQuestion
                                ? 'Weiter'
                                : 'Ergebnis anzeigen',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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

  Widget _buildAnswerOption(
    BuildContext context,
    String option,
    int index,
    bool isSelected,
    Color color,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? color.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? color : Colors.grey[300]!,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? color : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? color : Colors.grey[400]!,
                      width: 2,
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
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? color : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
}
