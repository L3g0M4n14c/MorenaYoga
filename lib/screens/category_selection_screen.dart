import 'package:flutter/material.dart';
import '../models/relaxation_area.dart';
import '../theme/app_theme.dart';
import 'specialized_survey_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  final List<RelaxationType> deficitAreas;
  final bool showAllCategories;

  const CategorySelectionScreen({
    super.key,
    required this.deficitAreas,
    this.showAllCategories = false,
  });

  @override
  Widget build(BuildContext context) {
    final categories = showAllCategories ? RelaxationType.values : deficitAreas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategorie auswählen'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.psychology,
                      size: 48,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Spezialisierter Fragebogen',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      showAllCategories
                          ? 'Wähle eine Kategorie für eine tiefergehende Analyse'
                          : 'Wähle einen deiner Defizitbereiche für eine tiefere Analyse',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                showAllCategories ? 'Alle Kategorien' : 'Deine Defizitbereiche',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Der spezialisierte Fragebogen enthält 8 gezielte Fragen, '
                'um die genauen Ursachen deiner Herausforderungen zu identifizieren '
                'und dir konkrete Maßnahmen vorzuschlagen.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              // Kategorien-Liste
              ...categories.map((type) {
                final area = RelaxationArea.getByType(type);
                final color = _getAreaColor(type);
                final isDeficit = deficitAreas.contains(type);

                return _buildCategoryCard(
                  context,
                  area,
                  color,
                  isDeficit,
                );
              }),

              const SizedBox(height: 16),

              // Info-Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Der spezialisierte Fragebogen dauert ca. 3-5 Minuten '
                        'und gibt dir sehr spezifische Empfehlungen.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    RelaxationArea area,
    Color color,
    bool isDeficit,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: isDeficit ? 6 : 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isDeficit
              ? BorderSide(color: Colors.orange, width: 2)
              : BorderSide.none,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SpecializedSurveyScreen(
                  targetArea: area.type,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withValues(alpha: 0.3),
                        color.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      area.icon,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              area.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                          if (isDeficit)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Empfohlen',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        area.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '8 spezialisierte Fragen',
                        style: TextStyle(
                          fontSize: 12,
                          color: color.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color,
                  size: 20,
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
