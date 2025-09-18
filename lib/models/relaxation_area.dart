enum RelaxationType {
  physical,
  mental,
  sensory,
  emotional,
  social,
  creative,
  spiritual,
}

class RelaxationArea {
  final RelaxationType type;
  final String name;
  final String description;
  final String icon;
  final List<String> keywords;

  const RelaxationArea({
    required this.type,
    required this.name,
    required this.description,
    required this.icon,
    required this.keywords,
  });

  static const List<RelaxationArea> allAreas = [
    RelaxationArea(
      type: RelaxationType.physical,
      name: 'Körperliche Entspannung',
      description: 'Entspannung durch körperliche Aktivitäten und Bewegung',
      icon: '🧘‍♀️',
      keywords: ['Bewegung', 'Sport', 'Yoga', 'Massage', 'Baden'],
    ),
    RelaxationArea(
      type: RelaxationType.mental,
      name: 'Mentale Entspannung',
      description: 'Entspannung des Geistes und der Gedanken',
      icon: '🧠',
      keywords: ['Meditation', 'Achtsamkeit', 'Konzentration', 'Lesen'],
    ),
    RelaxationArea(
      type: RelaxationType.emotional,
      name: 'Emotionale Entspannung',
      description: 'Umgang mit Gefühlen und emotionalem Stress',
      icon: '❤️',
      keywords: ['Gefühle', 'Musik', 'Kunst', 'Journaling'],
    ),
    RelaxationArea(
      type: RelaxationType.social,
      name: 'Soziale Entspannung',
      description: 'Entspannung in sozialen Situationen und Beziehungen',
      icon: '👥',
      keywords: ['Freunde', 'Familie', 'Gesellschaft', 'Kommunikation'],
    ),
    RelaxationArea(
      type: RelaxationType.spiritual,
      name: 'Spirituelle Entspannung',
      description: 'Verbindung zu höheren Werten und Sinnfindung',
      icon: '🙏',
      keywords: ['Spiritualität', 'Glaube', 'Natur', 'Dankbarkeit'],
    ),
    RelaxationArea(
      type: RelaxationType.sensory,
      name: 'Sensorische Entspannung',
      description: 'Entspannung durch die Sinne und Wahrnehmung',
      icon: '👁️',
      keywords: ['Sinne', 'Wahrnehmung', 'Aromatherapie', 'Musik', 'Berührung'],
    ),
    RelaxationArea(
      type: RelaxationType.creative,
      name: 'Kreative Entspannung',
      description: 'Entspannung durch kreative Tätigkeiten und Ausdruck',
      icon: '🎨',
      keywords: ['Kreativität', 'Kunst', 'Basteln', 'Schreiben', 'Gestalten'],
    ),
  ];

  static RelaxationArea getByType(RelaxationType type) {
    return allAreas.firstWhere((area) => area.type == type);
  }
}
