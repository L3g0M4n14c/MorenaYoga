import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/survey_provider.dart';
import '../models/relaxation_area.dart';
import '../models/survey_models.dart';
import '../theme/app_theme.dart';
import 'recommendations_screen.dart';
import 'welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ihre Ergebnisse'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<SurveyProvider>().reset();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Consumer<SurveyProvider>(
        builder: (context, provider, child) {
          final result = provider.result;
          if (result == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Überschrift
                Text(
                  'Ihre Entspannungsanalyse',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Basierend auf den 7 Arten der Entspannung',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),

                // Gesamtübersicht
                _buildOverviewCard(context, result),
                const SizedBox(height: 24),

                // Detailergebnisse
                Text(
                  'Detaillierte Ergebnisse',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),

                ...RelaxationType.values.map((type) {
                  final area = RelaxationArea.getByType(type);
                  final score = result.scores[type] ?? 0;
                  final level = result.levels[type] ?? RelaxationLevel.critical;
                  final isDeficit = result.deficitAreas.contains(type);

                  return _buildAreaResult(
                    context,
                    area,
                    score,
                    level,
                    isDeficit,
                  );
                }),

                const SizedBox(height: 32),

                // Aktionsbuttons
                if (result.deficitAreas.isNotEmpty) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RecommendationsScreen(
                              deficitAreas: result.deficitAreas,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Empfehlungen ansehen',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      provider.reset();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()),
                        (route) => false,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Test wiederholen',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context, SurveyResult result) {
    final averageScore = result.scores.values.isEmpty
        ? 0.0
        : result.scores.values.reduce((a, b) => a + b) / result.scores.length;

    Color cardColor;
    String title;
    String subtitle;
    IconData icon;

    if (averageScore >= 80) {
      cardColor = Colors.green;
      title = 'Ausgezeichnet!';
      subtitle = 'Sie sind sehr gut entspannt';
      icon = Icons.star;
    } else if (averageScore >= 60) {
      cardColor = Colors.orange;
      title = 'Gut';
      subtitle = 'Sie haben eine gute Balance';
      icon = Icons.thumb_up;
    } else {
      cardColor = Colors.red;
      title = 'Verbesserungsbedarf';
      subtitle = 'Einige Bereiche benötigen Aufmerksamkeit';
      icon = Icons.trending_up;
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cardColor.withOpacity(0.1), cardColor.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(icon, size: 48, color: cardColor),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cardColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '${averageScore.round()}% Gesamtwert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: cardColor,
              ),
            ),
            if (result.deficitAreas.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${result.deficitAreas.length} Bereich${result.deficitAreas.length > 1 ? 'e' : ''} mit Verbesserungspotential',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAreaResult(
    BuildContext context,
    RelaxationArea area,
    double score,
    RelaxationLevel level,
    bool isDeficit,
  ) {
    final color = _getAreaColor(area.type);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        area.icon,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          area.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          level.displayName,
                          style: TextStyle(
                            fontSize: 14,
                            color: _getLevelColor(level),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${score.round()}%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      if (isDeficit)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Fokus',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
              const SizedBox(height: 8),
              Text(
                level.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
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
