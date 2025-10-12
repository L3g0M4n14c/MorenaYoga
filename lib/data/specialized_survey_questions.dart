import '../models/survey_models.dart';
import '../models/relaxation_area.dart';

class SpecializedSurveyQuestions {
  // Spezialisierte Fragen für Körperliche Entspannung
  static const List<Question> physicalQuestions = [
    // Bewegungsqualität
    Question(
      id: 'physical_spec_1',
      question: 'Wie würdest du deine allgemeine Beweglichkeit einschätzen?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'flexibility',
      options: [
        'Sehr steif und unbeweglich',
        'Eher eingeschränkt',
        'Durchschnittlich beweglich',
        'Gut beweglich',
        'Sehr flexibel'
      ],
    ),
    Question(
      id: 'physical_spec_2',
      question: 'Wie oft leidest du unter Muskelverspannungen oder Schmerzen?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'tension',
      options: [
        'Täglich',
        'Mehrmals pro Woche',
        'Wöchentlich',
        'Selten',
        'Nie'
      ],
    ),
    Question(
      id: 'physical_spec_3',
      question: 'Wie ist deine Körperhaltung im Alltag (z.B. beim Sitzen)?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'posture',
      options: [
        'Sehr schlecht, oft gekrümmt',
        'Eher schlecht',
        'Mittelmäßig',
        'Gut',
        'Sehr gut, aufrecht'
      ],
    ),
    Question(
      id: 'physical_spec_4',
      question: 'Wie viele Stunden sitzt du täglich durchschnittlich?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'activity_level',
      options: [
        'Mehr als 10 Stunden',
        '7-10 Stunden',
        '5-7 Stunden',
        '3-5 Stunden',
        'Weniger als 3 Stunden'
      ],
    ),
    Question(
      id: 'physical_spec_5',
      question: 'Wie ist die Qualität deines Schlafs?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'sleep',
      options: [
        'Sehr schlecht, kaum erholsam',
        'Oft unterbrochen',
        'Mittelmäßig',
        'Meistens gut',
        'Ausgezeichnet, sehr erholsam'
      ],
    ),
    Question(
      id: 'physical_spec_6',
      question: 'Wie häufig fühlst du dich körperlich erschöpft?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'energy',
      options: ['Ständig', 'Sehr oft', 'Manchmal', 'Selten', 'Nie'],
    ),
    Question(
      id: 'physical_spec_7',
      question:
          'Praktizierst du gezielt Dehnübungen oder Mobilisationsübungen?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'stretching',
      options: [
        'Nie',
        'Sehr selten',
        'Gelegentlich (1-2x/Woche)',
        'Regelmäßig (3-4x/Woche)',
        'Täglich'
      ],
    ),
    Question(
      id: 'physical_spec_8',
      question: 'Wie gut kannst du bewusst einzelne Muskelgruppen entspannen?',
      relatedArea: RelaxationType.physical,
      surveyType: SurveyType.specialized,
      subCategory: 'awareness',
      options: ['Gar nicht', 'Sehr schwer', 'Mit Mühe', 'Gut', 'Sehr gut'],
    ),
  ];

  // Spezialisierte Fragen für Mentale Entspannung
  static const List<Question> mentalQuestions = [
    Question(
      id: 'mental_spec_1',
      question: 'Wie oft kreisen deine Gedanken um die gleichen Themen?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'rumination',
      options: ['Ständig', 'Sehr oft', 'Manchmal', 'Selten', 'Nie'],
    ),
    Question(
      id: 'mental_spec_2',
      question: 'Wie gut kannst du abends "abschalten" und zur Ruhe kommen?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'evening_relaxation',
      options: [
        'Gar nicht',
        'Sehr schwer',
        'Mit Anstrengung',
        'Gut',
        'Sehr leicht'
      ],
    ),
    Question(
      id: 'mental_spec_3',
      question: 'Wie stark lässt du dich von digitalen Medien ablenken?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'digital_distraction',
      options: [
        'Sehr stark, ständig',
        'Oft',
        'Mittelmäßig',
        'Wenig',
        'Kaum bis gar nicht'
      ],
    ),
    Question(
      id: 'mental_spec_4',
      question: 'Kannst du dich längere Zeit auf eine Aufgabe fokussieren?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'focus',
      options: [
        'Nein, sehr schwer',
        'Selten länger als 10 Min',
        'Ca. 20-30 Minuten',
        'Gut, 45-60 Minuten',
        'Sehr gut, über 1 Stunde'
      ],
    ),
    Question(
      id: 'mental_spec_5',
      question:
          'Wie oft machst du bewusste Pausen während der Arbeit/des Tages?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'breaks',
      options: [
        'Nie, ich arbeite durch',
        'Sehr selten',
        'Gelegentlich',
        'Regelmäßig',
        'Nach jedem konzentrierten Block'
      ],
    ),
    Question(
      id: 'mental_spec_6',
      question:
          'Wie häufig praktizierst du Atemübungen zur mentalen Beruhigung?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'breathing',
      options: ['Nie', 'Sehr selten', 'Manchmal', 'Oft', 'Täglich'],
    ),
    Question(
      id: 'mental_spec_7',
      question: 'Leidest du unter Vergesslichkeit oder Konzentrationsschwäche?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'cognitive_function',
      options: ['Sehr häufig', 'Oft', 'Manchmal', 'Selten', 'Nie'],
    ),
    Question(
      id: 'mental_spec_8',
      question:
          'Wie oft nimmst du dir Zeit für mentale "Auszeiten" (Nichtstun, Tagträumen)?',
      relatedArea: RelaxationType.mental,
      surveyType: SurveyType.specialized,
      subCategory: 'mental_breaks',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Regelmäßig', 'Täglich'],
    ),
  ];

  // Spezialisierte Fragen für Emotionale Entspannung
  static const List<Question> emotionalQuestions = [
    Question(
      id: 'emotional_spec_1',
      question:
          'Wie oft erlebst du emotionale Ausbrüche (Wut, Tränen, Frustration)?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'emotional_regulation',
      options: [
        'Täglich oder mehrmals täglich',
        'Mehrmals pro Woche',
        'Wöchentlich',
        'Selten',
        'Sehr selten bis nie'
      ],
    ),
    Question(
      id: 'emotional_spec_2',
      question: 'Kannst du deine Gefühle gut benennen und ausdrücken?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'emotional_awareness',
      options: [
        'Nein, gar nicht',
        'Sehr schwer',
        'Manchmal',
        'Meistens gut',
        'Sehr gut'
      ],
    ),
    Question(
      id: 'emotional_spec_3',
      question: 'Wie gehst du mit negativen Gefühlen um?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'coping',
      options: [
        'Verdränge sie komplett',
        'Versuche sie zu ignorieren',
        'Lasse sie manchmal zu',
        'Nehme sie bewusst wahr',
        'Verarbeite sie aktiv'
      ],
    ),
    Question(
      id: 'emotional_spec_4',
      question:
          'Hast du jemanden, mit dem du über deine Gefühle sprechen kannst?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'support',
      options: [
        'Nein, niemanden',
        'Kaum',
        'Eine Person',
        'Einige Personen',
        'Ja, mehrere Vertrauenspersonen'
      ],
    ),
    Question(
      id: 'emotional_spec_5',
      question: 'Wie oft fühlst du dich überfordert von deinen Emotionen?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'overwhelm',
      options: ['Sehr oft', 'Oft', 'Manchmal', 'Selten', 'Nie'],
    ),
    Question(
      id: 'emotional_spec_6',
      question: 'Praktizierst du Selbstmitgefühl wenn du Fehler machst?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'self_compassion',
      options: [
        'Nie, ich bin sehr selbstkritisch',
        'Selten',
        'Manchmal',
        'Oft',
        'Immer'
      ],
    ),
    Question(
      id: 'emotional_spec_7',
      question: 'Führst du Tagebuch oder journalst du deine Gefühle?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'journaling',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Wöchentlich', 'Täglich'],
    ),
    Question(
      id: 'emotional_spec_8',
      question: 'Wie schnell kannst du dich von emotionalen Tiefs erholen?',
      relatedArea: RelaxationType.emotional,
      surveyType: SurveyType.specialized,
      subCategory: 'resilience',
      options: [
        'Sehr langsam, tage- oder wochenlang',
        'Einige Tage',
        'Ein bis zwei Tage',
        'Wenige Stunden',
        'Sehr schnell'
      ],
    ),
  ];

  // Spezialisierte Fragen für Soziale Entspannung
  static const List<Question> socialQuestions = [
    Question(
      id: 'social_spec_1',
      question: 'Fühlst du dich in großen Gruppen wohl?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'group_comfort',
      options: [
        'Nein, sehr unwohl',
        'Eher unwohl',
        'Neutral',
        'Meistens wohl',
        'Sehr wohl'
      ],
    ),
    Question(
      id: 'social_spec_2',
      question:
          'Wie oft sagst du "Nein" zu sozialen Verpflichtungen, weil sie dich stressen?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'boundaries',
      options: [
        'Sehr oft',
        'Oft',
        'Manchmal',
        'Selten',
        'Nie, ich genieße sie'
      ],
    ),
    Question(
      id: 'social_spec_3',
      question: 'Wie viel Zeit brauchst du alleine zum "Aufladen"?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'recharge',
      options: [
        'Sehr viel, bin schnell erschöpft',
        'Relativ viel',
        'Mittelmäßig',
        'Wenig',
        'Kaum, ich tanke in Gesellschaft Energie'
      ],
    ),
    Question(
      id: 'social_spec_4',
      question:
          'Fühlst du dich in deinen Beziehungen verstanden und akzeptiert?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'acceptance',
      options: [
        'Nein, gar nicht',
        'Selten',
        'Manchmal',
        'Meistens',
        'Ja, vollkommen'
      ],
    ),
    Question(
      id: 'social_spec_5',
      question: 'Wie oft erlebst du Konflikte in deinen Beziehungen?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'conflicts',
      options: ['Sehr häufig', 'Oft', 'Gelegentlich', 'Selten', 'Sehr selten'],
    ),
    Question(
      id: 'social_spec_6',
      question:
          'Kannst du in Gesellschaft authentisch sein, ohne dich verstellen zu müssen?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'authenticity',
      options: [
        'Nein, verstelle mich oft',
        'Selten',
        'Manchmal',
        'Meistens',
        'Ja, immer'
      ],
    ),
    Question(
      id: 'social_spec_7',
      question:
          'Hast du regelmäßig qualitativ hochwertige Zeit mit Menschen, die dir wichtig sind?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'quality_time',
      options: [
        'Nein, sehr selten',
        'Selten',
        'Gelegentlich',
        'Regelmäßig',
        'Ja, sehr oft'
      ],
    ),
    Question(
      id: 'social_spec_8',
      question: 'Wie gut gelingt es dir, Grenzen in Beziehungen zu setzen?',
      relatedArea: RelaxationType.social,
      surveyType: SurveyType.specialized,
      subCategory: 'boundary_setting',
      options: [
        'Gar nicht',
        'Sehr schlecht',
        'Manchmal',
        'Meistens gut',
        'Sehr gut'
      ],
    ),
  ];

  // Spezialisierte Fragen für Spirituelle Entspannung
  static const List<Question> spiritualQuestions = [
    Question(
      id: 'spiritual_spec_1',
      question: 'Fühlst du eine Verbindung zu etwas Größerem als dir selbst?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'connection',
      options: [
        'Nein, gar nicht',
        'Selten',
        'Manchmal',
        'Oft',
        'Ja, sehr stark'
      ],
    ),
    Question(
      id: 'spiritual_spec_2',
      question: 'Wie oft verbringst du bewusst Zeit in der Natur?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'nature',
      options: [
        'Nie',
        'Selten',
        'Monatlich',
        'Wöchentlich',
        'Täglich oder fast täglich'
      ],
    ),
    Question(
      id: 'spiritual_spec_3',
      question: 'Hast du das Gefühl, dass dein Leben einen tieferen Sinn hat?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'meaning',
      options: [
        'Nein, überhaupt nicht',
        'Selten',
        'Manchmal',
        'Meistens',
        'Ja, definitiv'
      ],
    ),
    Question(
      id: 'spiritual_spec_4',
      question: 'Praktizierst du regelmäßig Dankbarkeit?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'gratitude',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Wöchentlich', 'Täglich'],
    ),
    Question(
      id: 'spiritual_spec_5',
      question: 'Hast du spirituelle Praktiken oder Rituale in deinem Leben?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'practices',
      options: [
        'Nein, keine',
        'Sehr wenige',
        'Einige',
        'Mehrere',
        'Ja, viele regelmäßige Praktiken'
      ],
    ),
    Question(
      id: 'spiritual_spec_6',
      question: 'Fühlst du dich mit deinen persönlichen Werten verbunden?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'values',
      options: [
        'Nein, kenne sie kaum',
        'Wenig',
        'Teilweise',
        'Meistens',
        'Ja, sehr stark'
      ],
    ),
    Question(
      id: 'spiritual_spec_7',
      question: 'Nimmst du dir Zeit für Stille und innere Einkehr?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'silence',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Wöchentlich', 'Täglich'],
    ),
    Question(
      id: 'spiritual_spec_8',
      question: 'Erlebst du Momente von Ehrfurcht oder Staunen (Awe)?',
      relatedArea: RelaxationType.spiritual,
      surveyType: SurveyType.specialized,
      subCategory: 'awe',
      options: ['Nie', 'Sehr selten', 'Manchmal', 'Regelmäßig', 'Oft'],
    ),
  ];

  // Spezialisierte Fragen für Sensorische Entspannung
  static const List<Question> sensoryQuestions = [
    Question(
      id: 'sensory_spec_1',
      question: 'Wie empfindlich reagierst du auf laute Geräusche?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'sound_sensitivity',
      options: [
        'Sehr empfindlich, stresst mich stark',
        'Ziemlich empfindlich',
        'Mittelmäßig',
        'Wenig empfindlich',
        'Gar nicht empfindlich'
      ],
    ),
    Question(
      id: 'sensory_spec_2',
      question: 'Nutzt du bewusst beruhigende Düfte (Aromatherapie)?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'smell',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Regelmäßig', 'Täglich'],
    ),
    Question(
      id: 'sensory_spec_3',
      question:
          'Wie stark beeinflusst helles oder flackerndes Licht dein Wohlbefinden?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'light_sensitivity',
      options: [
        'Sehr stark negativ',
        'Ziemlich stark',
        'Mittelmäßig',
        'Wenig',
        'Gar nicht'
      ],
    ),
    Question(
      id: 'sensory_spec_4',
      question:
          'Achtest du auf angenehme Texturen in deiner Umgebung (Kleidung, Möbel)?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'touch',
      options: ['Nein, nie', 'Selten', 'Manchmal', 'Oft', 'Ja, sehr bewusst'],
    ),
    Question(
      id: 'sensory_spec_5',
      question: 'Nutzt du Musik oder Klänge gezielt zur Entspannung?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'sound_therapy',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Oft', 'Täglich'],
    ),
    Question(
      id: 'sensory_spec_6',
      question:
          'Wie oft gönnst du dir sensorische Verwöhn-Momente (Bad, Massage)?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'sensory_indulgence',
      options: [
        'Nie',
        'Sehr selten',
        'Monatlich',
        'Wöchentlich',
        'Mehrmals pro Woche'
      ],
    ),
    Question(
      id: 'sensory_spec_7',
      question:
          'Fühlst du dich von zu vielen Sinneseindrücken schnell überreizt?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'overstimulation',
      options: ['Ja, sehr schnell', 'Oft', 'Manchmal', 'Selten', 'Nie'],
    ),
    Question(
      id: 'sensory_spec_8',
      question: 'Praktizierst du achtsames Essen (bewusstes Schmecken)?',
      relatedArea: RelaxationType.sensory,
      surveyType: SurveyType.specialized,
      subCategory: 'taste',
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Bei jeder Mahlzeit'],
    ),
  ];

  // Spezialisierte Fragen für Kreative Entspannung
  static const List<Question> creativeQuestions = [
    Question(
      id: 'creative_spec_1',
      question:
          'Wie oft erlebst du einen "Flow"-Zustand bei kreativen Tätigkeiten?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'flow',
      options: ['Nie', 'Sehr selten', 'Manchmal', 'Oft', 'Sehr häufig'],
    ),
    Question(
      id: 'creative_spec_2',
      question: 'Gibst du dir selbst Raum für spontane kreative Ideen?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'spontaneity',
      options: ['Nein, nie', 'Selten', 'Manchmal', 'Oft', 'Ja, regelmäßig'],
    ),
    Question(
      id: 'creative_spec_3',
      question:
          'Hast du einen dedizierten Raum oder Zeit für kreative Tätigkeiten?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'creative_space',
      options: [
        'Nein, beides nicht',
        'Etwas Zeit, aber keinen Raum',
        'Manchmal Zeit',
        'Ja, entweder Zeit oder Raum',
        'Ja, beides'
      ],
    ),
    Question(
      id: 'creative_spec_4',
      question: 'Wie gehst du mit "Fehlern" in deinen kreativen Projekten um?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'perfectionism',
      options: [
        'Sehr frustriert, gebe oft auf',
        'Frustriert',
        'Neutral',
        'Sehe sie als Lernchance',
        'Begrüße sie als Teil des Prozesses'
      ],
    ),
    Question(
      id: 'creative_spec_5',
      question:
          'Experimentierst du mit verschiedenen kreativen Ausdrucksformen?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'variety',
      options: [
        'Nein, mache nichts Kreatives',
        'Nein, bleibe bei einer Form',
        'Manchmal probiere ich Neues',
        'Ja, einige verschiedene',
        'Ja, sehr vielfältig'
      ],
    ),
    Question(
      id: 'creative_spec_6',
      question: 'Nutzt du Kreativität als Ventil für Emotionen?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'emotional_expression',
      options: ['Nie', 'Selten', 'Manchmal', 'Oft', 'Regelmäßig'],
    ),
    Question(
      id: 'creative_spec_7',
      question:
          'Wie oft arbeitest du mit deinen Händen (basteln, kochen, gärtnern)?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'hands_on',
      options: ['Nie', 'Sehr selten', 'Gelegentlich', 'Wöchentlich', 'Täglich'],
    ),
    Question(
      id: 'creative_spec_8',
      question: 'Teilst du deine kreativen Werke mit anderen?',
      relatedArea: RelaxationType.creative,
      surveyType: SurveyType.specialized,
      subCategory: 'sharing',
      options: [
        'Nie, zu unsicher',
        'Sehr selten',
        'Manchmal',
        'Oft',
        'Ja, gerne und regelmäßig'
      ],
    ),
  ];

  static List<Question> getSpecializedQuestions(RelaxationType type) {
    switch (type) {
      case RelaxationType.physical:
        return physicalQuestions;
      case RelaxationType.mental:
        return mentalQuestions;
      case RelaxationType.emotional:
        return emotionalQuestions;
      case RelaxationType.social:
        return socialQuestions;
      case RelaxationType.spiritual:
        return spiritualQuestions;
      case RelaxationType.sensory:
        return sensoryQuestions;
      case RelaxationType.creative:
        return creativeQuestions;
    }
  }
}
