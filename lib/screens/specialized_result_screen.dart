import 'package:flutter/material.dart';
import '../models/survey_models.dart';
import '../models/relaxation_area.dart';
import '../providers/specialized_survey_provider.dart';
import '../data/specialized_recommendations.dart';
import '../theme/app_theme.dart';

class SpecializedResultScreen extends StatelessWidget {
  final SurveyResult result;
  final SpecializedSurveyProvider provider;

  const SpecializedResultScreen({
    super.key,
    required this.result,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final area = RelaxationArea.getByType(result.specializedArea!);
    final color = _getAreaColor(result.specializedArea!);
    final score = result.scores[result.specializedArea] ?? 0;
    final level =
        result.levels[result.specializedArea] ?? RelaxationLevel.critical;
    final subCategoryScores = result.subCategoryScores ?? {};

    // Sortiere Unterkategorien nach Score (niedrigste zuerst)
    final sortedSubCategories = subCategoryScores.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detaillierte Analyse'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header mit Gesamtergebnis
              _buildHeaderCard(context, area, color, score, level),

              const SizedBox(height: 24),

              // Unterkategorien-Analyse
              Text(
                'Detaillierte Analyse',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Hier siehst du, in welchen spezifischen Bereichen du Stärken '
                'und Verbesserungspotential hast:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

              // Unterkategorien-Liste
              ...sortedSubCategories.map((entry) {
                return _buildSubCategoryCard(
                  context,
                  entry.key,
                  entry.value,
                  color,
                );
              }),

              const SizedBox(height: 32),

              // Empfehlungen-Sektion
              Text(
                'Personalisierte Empfehlungen',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Basierend auf deinen Antworten haben wir diese spezifischen '
                'Maßnahmen für dich zusammengestellt:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

              // Empfehlungen für die schwächsten Unterkategorien
              ...sortedSubCategories.take(3).map((entry) {
                if (entry.value < 70) {
                  // Nur Empfehlungen für Bereiche unter 70%
                  return _buildRecommendationsCard(
                    context,
                    entry.key,
                    result.specializedArea!,
                    color,
                  );
                }
                return const SizedBox.shrink();
              }),

              const SizedBox(height: 24),

              // Motivationsnachricht
              _buildMotivationCard(context, color),

              const SizedBox(height: 24),

              // Aktionsbuttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.reset();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Zur Startseite',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    provider.reset();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: color),
                  ),
                  child: Text(
                    'Andere Kategorie analysieren',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(
    BuildContext context,
    RelaxationArea area,
    Color color,
    double score,
    RelaxationLevel level,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.2),
              color.withValues(alpha: 0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      area.icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        area.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Spezialisierte Analyse',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildScoreItem(
                  context,
                  'Gesamtscore',
                  '${score.round()}%',
                  color,
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.grey[300],
                ),
                _buildScoreItem(
                  context,
                  'Status',
                  level.displayName,
                  _getLevelColor(level),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildSubCategoryCard(
    BuildContext context,
    String subCategory,
    double score,
    Color color,
  ) {
    final displayName = provider.getSubCategoryDisplayName(subCategory);
    final isDeficit = score < 60;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: isDeficit ? 4 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isDeficit
              ? const BorderSide(color: Colors.orange, width: 2)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (isDeficit)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Fokus',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Text(
                    '${score.round()}%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationsCard(
    BuildContext context,
    String subCategory,
    RelaxationType type,
    Color color,
  ) {
    final displayName = provider.getSubCategoryDisplayName(subCategory);
    final recommendations =
        SpecializedRecommendationData.getSpecializedRecommendations(
            type, subCategory);
    final motivation =
        SpecializedRecommendationData.getSubCategoryMotivation(subCategory);

    if (recommendations.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.flag,
                      color: color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      displayName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: color,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        motivation,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: color.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Konkrete Maßnahmen:',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              ...recommendations.map((recommendation) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          recommendation,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard(BuildContext context, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.1),
            color.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.auto_awesome,
            color: color,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            'Dein nächster Schritt',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Wähle 1-2 Maßnahmen aus, die du in den nächsten Tagen umsetzen möchtest. '
            'Kleine, konsequente Schritte führen zu großen Veränderungen. '
            'Du musst nicht alles auf einmal ändern!',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
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

  Color _getLevelColor(RelaxationLevel level) {
    switch (level) {
      case RelaxationLevel.excellent:
        return Colors.green;
      case RelaxationLevel.good:
        return Colors.lightGreen;
      case RelaxationLevel.moderate:
        return Colors.orange;
      case RelaxationLevel.poor:
        return Colors.deepOrange;
      case RelaxationLevel.critical:
        return Colors.red;
    }
  }
}
