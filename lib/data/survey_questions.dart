import '../models/survey_models.dart';
import '../models/relaxation_area.dart';

class SurveyQuestions {
  static const List<Question> questions = [
    // Körperliche Entspannung
    Question(
      id: 'physical_1',
      question: 'Wie oft treiben Sie Sport oder bewegen sich bewusst?',
      relatedArea: RelaxationType.physical,
      options: [
        'Gar nicht',
        'Selten (1x pro Monat)',
        'Gelegentlich (1-2x pro Woche)',
        'Regelmäßig (3-4x pro Woche)',
        'Täglich'
      ],
    ),
    Question(
      id: 'physical_2',
      question: 'Wie entspannt fühlen Sie sich nach körperlicher Aktivität?',
      relatedArea: RelaxationType.physical,
      options: [
        'Gar nicht entspannt',
        'Wenig entspannt',
        'Etwas entspannt',
        'Sehr entspannt',
        'Vollkommen entspannt'
      ],
    ),
    Question(
      id: 'physical_3',
      question:
          'Wie oft praktizieren Sie Entspannungstechniken wie Yoga oder Stretching?',
      relatedArea: RelaxationType.physical,
      options: ['Nie', 'Sehr selten', 'Manchmal', 'Regelmäßig', 'Täglich'],
    ),

    // Mentale Entspannung
    Question(
      id: 'mental_1',
      question: 'Wie oft können Sie Ihre Gedanken zur Ruhe bringen?',
      relatedArea: RelaxationType.mental,
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Immer'],
    ),
    Question(
      id: 'mental_2',
      question: 'Wie gut können Sie sich konzentrieren, wenn Sie es möchten?',
      relatedArea: RelaxationType.mental,
      options: ['Gar nicht', 'Schlecht', 'Mittelmäßig', 'Gut', 'Sehr gut'],
    ),
    Question(
      id: 'mental_3',
      question: 'Praktizieren Sie Meditation oder Achtsamkeitsübungen?',
      relatedArea: RelaxationType.mental,
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Regelmäßig', 'Täglich'],
    ),

    // Emotionale Entspannung
    Question(
      id: 'emotional_1',
      question: 'Wie gut können Sie mit negativen Emotionen umgehen?',
      relatedArea: RelaxationType.emotional,
      options: ['Sehr schlecht', 'Schlecht', 'Mittelmäßig', 'Gut', 'Sehr gut'],
    ),
    Question(
      id: 'emotional_2',
      question: 'Wie oft fühlen Sie sich emotional ausgeglichen?',
      relatedArea: RelaxationType.emotional,
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Immer'],
    ),
    Question(
      id: 'emotional_3',
      question: 'Nutzen Sie kreative Aktivitäten zum emotionalen Ausgleich?',
      relatedArea: RelaxationType.emotional,
      options: ['Nie', 'Selten', 'Gelegentlich', 'Oft', 'Sehr oft'],
    ),

    // Soziale Entspannung
    Question(
      id: 'social_1',
      question: 'Wie entspannt fühlen Sie sich in sozialen Situationen?',
      relatedArea: RelaxationType.social,
      options: [
        'Sehr angespannt',
        'Angespannt',
        'Neutral',
        'Entspannt',
        'Sehr entspannt'
      ],
    ),
    Question(
      id: 'social_2',
      question: 'Wie oft verbringen Sie Zeit mit Menschen, die Ihnen gut tun?',
      relatedArea: RelaxationType.social,
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Sehr oft'],
    ),
    Question(
      id: 'social_3',
      question: 'Können Sie in Gesellschaft abschalten und entspannen?',
      relatedArea: RelaxationType.social,
      options: ['Gar nicht', 'Kaum', 'Etwas', 'Gut', 'Sehr gut'],
    ),

    // Spirituelle Entspannung
    Question(
      id: 'spiritual_1',
      question: 'Wie verbunden fühlen Sie sich mit der Natur?',
      relatedArea: RelaxationType.spiritual,
      options: ['Gar nicht', 'Wenig', 'Etwas', 'Sehr', 'Vollkommen'],
    ),
    Question(
      id: 'spiritual_2',
      question: 'Haben Sie das Gefühl, einen Sinn in Ihrem Leben zu haben?',
      relatedArea: RelaxationType.spiritual,
      options: [
        'Gar nicht',
        'Wenig',
        'Teilweise',
        'Größtenteils',
        'Vollkommen'
      ],
    ),
    Question(
      id: 'spiritual_3',
      question: 'Praktizieren Sie Dankbarkeit oder spirituelle Rituale?',
      relatedArea: RelaxationType.spiritual,
      options: ['Nie', 'Selten', 'Gelegentlich', 'Oft', 'Täglich'],
    ),

    // Sensorische Entspannung
    Question(
      id: 'sensory_1',
      question:
          'Wie oft nutzen Sie bewusst Ihre Sinne zur Entspannung (Düfte, Musik, Berührung)?',
      relatedArea: RelaxationType.sensory,
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Sehr oft'],
    ),
    Question(
      id: 'sensory_2',
      question:
          'Wie entspannend empfinden Sie sensorische Erfahrungen (warmes Bad, Massage, beruhigende Musik)?',
      relatedArea: RelaxationType.sensory,
      options: [
        'Gar nicht entspannend',
        'Wenig entspannend',
        'Etwas entspannend',
        'Sehr entspannend',
        'Extrem entspannend'
      ],
    ),
    Question(
      id: 'sensory_3',
      question:
          'Wie aufmerksam nehmen Sie Ihre Umgebung mit allen Sinnen wahr?',
      relatedArea: RelaxationType.sensory,
      options: [
        'Sehr unaufmerksam',
        'Unaufmerksam',
        'Mittelmäßig aufmerksam',
        'Aufmerksam',
        'Sehr aufmerksam'
      ],
    ),

    // Kreative Entspannung
    Question(
      id: 'creative_1',
      question:
          'Wie oft beschäftigen Sie sich mit kreativen Tätigkeiten (Malen, Schreiben, Basteln)?',
      relatedArea: RelaxationType.creative,
      options: ['Nie', 'Selten', 'Manchmal', 'Regelmäßig', 'Sehr oft'],
    ),
    Question(
      id: 'creative_2',
      question: 'Wie entspannend empfinden Sie kreative Aktivitäten?',
      relatedArea: RelaxationType.creative,
      options: [
        'Gar nicht entspannend',
        'Wenig entspannend',
        'Etwas entspannend',
        'Sehr entspannend',
        'Extrem entspannend'
      ],
    ),
    Question(
      id: 'creative_3',
      question: 'Nutzen Sie kreative Ausdrucksformen, um Stress abzubauen?',
      relatedArea: RelaxationType.creative,
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Sehr oft'],
    ),
  ];
}
