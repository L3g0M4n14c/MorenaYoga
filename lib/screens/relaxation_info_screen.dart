import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/relaxation_area.dart';
import '../theme/app_theme.dart';

class RelaxationInfoScreen extends StatelessWidget {
  const RelaxationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Die 7 Faktoren der Entspannung'),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryColor,
              AppTheme.secondaryColor,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildIntroCard(),
            const SizedBox(height: 16),
            ...RelaxationArea.allAreas
                .map((area) => _buildFactorCard(context, area)),
            const SizedBox(height: 16),
            _buildSourcesCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.psychology,
                    color: AppTheme.primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Wissenschaftliche Grundlagen',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Forschungen in der Stressmedizin und Psychologie zeigen, dass echter Ausgleich '
              'nur entsteht, wenn wir alle Aspekte unseres Seins berücksichtigen. Die 7 Faktoren '
              'der Entspannung basieren auf einem ganzheitlichen Ansatz, der Körper, Geist und Seele '
              'gleichermaßen einbezieht.',
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactorCard(BuildContext context, RelaxationArea area) {
    final details = _getDetailedInfo(area.type);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        leading: Text(
          area.icon,
          style: const TextStyle(fontSize: 32),
        ),
        title: Text(
          area.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            area.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wissenschaftlicher Hintergrund:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  details.scientificBackground,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Warum ist es wichtig?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  details.importance,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
                if (details.benefits.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Vorteile:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...details.benefits.map((benefit) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Text(
                                benefit,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.textSecondary,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourcesCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.book,
                    color: AppTheme.primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Wissenschaftliche Quellen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSourceItem(
              'American Psychological Association (APA)',
              'Stress Management Techniques',
              'https://www.apa.org/topics/stress',
            ),
            _buildSourceItem(
              'Mayo Clinic',
              'Stress relief: When and how to say no',
              'https://www.mayoclinic.org/healthy-lifestyle/stress-management',
            ),
            _buildSourceItem(
              'Harvard Health Publishing',
              'Relaxation techniques: Breath control helps quell stress',
              'https://www.health.harvard.edu/mind-and-mood/relaxation-techniques-breath-control-helps-quell-errant-stress-response',
            ),
            _buildSourceItem(
              'National Center for Complementary and Integrative Health',
              'Relaxation Techniques for Health',
              'https://www.nccih.nih.gov/health/relaxation-techniques-what-you-need-to-know',
            ),
            _buildSourceItem(
              'Techniker Krankenkasse',
              'Entspannungstechniken im Überblick',
              'https://www.tk.de/techniker/gesundheit-und-medizin/praevention-und-frueherkennung/entspannungstechniken-2021016',
            ),
            _buildSourceItem(
              'Bundeszentrale für gesundheitliche Aufklärung',
              'Entspannung und Stressbewältigung',
              'https://www.bzga.de',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceItem(String source, String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _launchURL(url),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.link,
              size: 16,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    source,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  _FactorDetails _getDetailedInfo(RelaxationType type) {
    switch (type) {
      case RelaxationType.physical:
        return const _FactorDetails(
          scientificBackground:
              'Körperliche Aktivität führt zur Ausschüttung von Endorphinen, den sogenannten '
              '"Glückshormonen", und reduziert gleichzeitig Stresshormone wie Cortisol. '
              'Regelmäßige Bewegung verbessert die Schlafqualität und fördert die Muskelentspannung.',
          importance:
              'Ein entspannter Körper ist die Grundlage für mentales und emotionales Wohlbefinden. '
              'Chronische Verspannungen können zu Schmerzen, Schlafstörungen und erhöhter '
              'Stressanfälligkeit führen.',
          benefits: [
            'Reduzierung von Muskelverspannungen und Schmerzen',
            'Verbesserung der Schlafqualität',
            'Stärkung des Immunsystems',
            'Erhöhung der Körperwahrnehmung',
            'Abbau von Stresshormonen',
          ],
        );
      case RelaxationType.mental:
        return const _FactorDetails(
          scientificBackground:
              'Achtsamkeits- und Meditationspraktiken verändern nachweislich die Gehirnstruktur, '
              'insbesondere in Bereichen, die für Stressverarbeitung zuständig sind (Amygdala, '
              'präfrontaler Cortex). Mentale Entspannung aktiviert den Parasympathikus und fördert '
              'die neuroplastische Entwicklung.',
          importance:
              'Ein überaktiver Geist führt zu mentalem Stress, Konzentrationsproblemen und '
              'Erschöpfung. Mentale Entspannung ist essentiell für Klarheit, Fokus und '
              'Entscheidungsfähigkeit.',
          benefits: [
            'Verbesserte Konzentration und Gedächtnisleistung',
            'Reduzierung von Grübeln und negativen Gedankenmustern',
            'Erhöhte emotionale Stabilität',
            'Bessere Stressresilienz',
            'Förderung von Kreativität und Problemlösung',
          ],
        );
      case RelaxationType.emotional:
        return const _FactorDetails(
          scientificBackground:
              'Emotionale Regulation aktiviert das limbische System und den präfrontalen Cortex. '
              'Die Verarbeitung von Emotionen ist neurobiologisch eng mit körperlichen Reaktionen '
              'verbunden. Unterdrückte Emotionen können zu chronischem Stress und psychosomatischen '
              'Beschwerden führen.',
          importance:
              'Emotionale Anspannung manifestiert sich oft körperlich (Herzrasen, Magenbeschwerden) '
              'und kann zu Burnout, Angststörungen und Depressionen führen. Emotionale Entspannung '
              'ist der Schlüssel zur psychischen Gesundheit.',
          benefits: [
            'Bessere Selbstwahrnehmung und Selbstakzeptanz',
            'Reduzierung von Angst und Depression',
            'Verbesserte Beziehungen zu anderen',
            'Erhöhte emotionale Intelligenz',
            'Stärkere psychische Widerstandskraft',
          ],
        );
      case RelaxationType.social:
        return const _FactorDetails(
          scientificBackground:
              'Soziale Verbindungen setzen Oxytocin frei, das "Bindungshormon", welches Stress '
              'reduziert und Wohlbefinden fördert. Studien zeigen, dass soziale Unterstützung '
              'einer der stärksten Schutzfaktoren gegen Stress und Krankheiten ist.',
          importance:
              'Soziale Isolation erhöht nachweislich das Risiko für psychische und physische '
              'Erkrankungen. Menschen sind soziale Wesen - qualitativ hochwertige Beziehungen '
              'sind essentiell für Gesundheit und Lebensqualität.',
          benefits: [
            'Reduzierung von Einsamkeit und Depression',
            'Stärkung des Immunsystems',
            'Erhöhte Lebenserwartung',
            'Bessere Stressbewältigung durch soziale Unterstützung',
            'Gefühl von Zugehörigkeit und Sinn',
          ],
        );
      case RelaxationType.spiritual:
        return const _FactorDetails(
          scientificBackground:
              'Spirituelle Praktiken aktivieren Gehirnareale, die mit Sinnfindung, Transzendenz '
              'und innerem Frieden verbunden sind. Studien zeigen, dass Menschen mit spiritueller '
              'Praxis niedrigere Cortisolspiegel und höhere Resilienz aufweisen.',
          importance:
              'Der Mangel an Sinn und Lebenszweck führt zu existenzieller Leere und erhöhter '
              'Anfälligkeit für psychische Krisen. Spirituelle Entspannung bietet Perspektive '
              'und Verbindung zu etwas Größerem.',
          benefits: [
            'Erhöhtes Gefühl von Sinn und Lebenszweck',
            'Reduzierung existenzieller Ängste',
            'Verbesserte Perspektive auf Herausforderungen',
            'Tiefere innere Ruhe und Gelassenheit',
            'Stärkere Verbindung zu sich selbst und der Welt',
          ],
        );
      case RelaxationType.sensory:
        return const _FactorDetails(
          scientificBackground:
              'Sensorische Stimulation beeinflusst direkt das vegetative Nervensystem. '
              'Angenehme Sinnesreize (Düfte, Berührungen, Klänge) aktivieren den Parasympathikus '
              'und fördern Entspannung. Aromatherapie und Musiktherapie sind wissenschaftlich '
              'anerkannte Methoden zur Stressreduktion.',
          importance:
              'Reizüberflutung durch digitale Medien und Umweltstress führt zu sensorischer '
              'Erschöpfung. Bewusste sensorische Entspannung hilft, das Nervensystem zu regulieren '
              'und in den Ruhemodus zu versetzen.',
          benefits: [
            'Schnelle Aktivierung der Entspannungsreaktion',
            'Reduzierung von sensorischer Überstimulation',
            'Verbesserte Körperwahrnehmung',
            'Förderung von Achtsamkeit im Moment',
            'Natürliche Schmerzlinderung',
          ],
        );
      case RelaxationType.creative:
        return const _FactorDetails(
          scientificBackground:
              'Kreative Tätigkeiten induzieren einen "Flow-Zustand", der mit erhöhter '
              'Dopaminausschüttung und reduziertem Stress einhergeht. Beim kreativen Schaffen '
              'werden beide Gehirnhälften aktiviert, was zu tiefer Entspannung und Zufriedenheit führt.',
          importance:
              'Kreative Entfaltung ist ein menschliches Grundbedürfnis. Mangelnde kreative '
              'Ausdruckmöglichkeiten können zu Frustration, innerer Leere und reduzierter '
              'Lebensfreude führen.',
          benefits: [
            'Förderung des Flow-Erlebens',
            'Steigerung von Selbstwirksamkeit und Selbstwert',
            'Verarbeitung von Emotionen durch Ausdruck',
            'Reduzierung von Grübeln und Sorgen',
            'Erhöhung von Lebensfreude und Erfüllung',
          ],
        );
    }
  }
}

class _FactorDetails {
  final String scientificBackground;
  final String importance;
  final List<String> benefits;

  const _FactorDetails({
    required this.scientificBackground,
    required this.importance,
    required this.benefits,
  });
}
