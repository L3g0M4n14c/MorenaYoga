import '../models/relaxation_area.dart';

class SpecializedRecommendationData {
  // Detaillierte Empfehlungen basierend auf Unterkategorien

  // Körperliche Entspannung - Unterkategorien
  static const Map<String, List<String>> physicalRecommendations = {
    'flexibility': [
      '🧘‍♀️ Starte mit 10 Minuten täglichem Stretching am Morgen',
      '🤸‍♀️ Probiere Yin Yoga für tiefe Dehnung',
      '🔄 Mache Gelenksmobilisationen (Kreisen, Beugen, Strecken)',
      '📱 Nutze Stretching-Apps wie "StretchIt" oder "Flexibility Training"',
      '🎯 Setze dir ein Ziel: Spagat, Brücke oder ähnliches',
    ],
    'tension': [
      '💆‍♀️ Gönn dir regelmäßige professionelle Massagen',
      '🎾 Nutze Faszienrollen oder Massagebälle',
      '🔥 Wende Wärme an (Wärmflasche, warmes Bad)',
      '🧘‍♀️ Lerne Progressive Muskelentspannung nach Jacobson',
      '👨‍⚕️ Konsultiere einen Physiotherapeuten bei chronischen Verspannungen',
    ],
    'posture': [
      '🪑 Investiere in einen ergonomischen Arbeitsplatz',
      '⏰ Stelle stündliche Erinnerungen für Haltungscheck',
      '💪 Stärke deine Rumpfmuskulatur (Core-Training)',
      '🧘 Praktiziere Yoga-Übungen für bessere Haltung (Krieger, Berg)',
      '📐 Achte auf 90-Grad-Winkel beim Sitzen',
    ],
    'activity_level': [
      '⏰ Setze einen Timer: alle 30-60 Min. aufstehen und bewegen',
      '🚶‍♀️ Führe "Walking Meetings" ein',
      '🎯 Ziel: 10.000 Schritte täglich',
      '🏢 Nutze die Treppe statt den Aufzug',
      '🚴‍♀️ Fahre mit dem Rad statt Auto/Bus',
    ],
    'sleep': [
      '😴 Etabliere eine feste Schlafenszeit-Routine',
      '📱 Keine Bildschirme 1 Stunde vor dem Schlafen',
      '🌡️ Optimiere die Schlafzimmertemperatur (16-18°C)',
      '☕ Vermeide Koffein nach 14 Uhr',
      '📖 Lies etwas Beruhigendes vor dem Schlaf',
      '🧘‍♀️ Praktiziere Yoga Nidra oder Body Scan',
    ],
    'energy': [
      '💧 Trinke ausreichend Wasser (2-3 Liter täglich)',
      '🥗 Achte auf ausgewogene, nährstoffreiche Ernährung',
      '⚡ Mache kurze Power-Naps (15-20 Min)',
      '🏃‍♀️ Bewege dich regelmäßig - Bewegung gibt Energie!',
      '🩺 Lass deine Blutwerte checken (Vitamin D, B12, Eisen)',
    ],
    'stretching': [
      '📅 Plane feste Stretching-Zeiten in deinen Kalender',
      '🌅 Morgen-Routine: 5-10 Min. Ganzkörper-Stretching',
      '🌙 Abend-Routine: Entspannende Dehnungen vor dem Schlaf',
      '💼 Desk-Stretches während der Arbeit',
      '📚 Lerne verschiedene Stretching-Techniken (dynamisch, statisch)',
    ],
    'awareness': [
      '🧘‍♀️ Praktiziere Body-Scan-Meditationen',
      '💭 Mache regelmäßige "Body-Checks" im Alltag',
      '🎯 Lerne Progressive Muskelrelaxation',
      '🧠 Nimm an einem Kurs für Körperwahrnehmung teil',
      '📝 Führe ein Körper-Tagebuch',
    ],
  };

  // Mentale Entspannung - Unterkategorien
  static const Map<String, List<String>> mentalRecommendations = {
    'rumination': [
      '📝 Schreibe Gedanken auf Papier, um sie aus dem Kopf zu bekommen',
      '🧘‍♀️ Praktiziere Achtsamkeitsmeditation',
      '🔄 Nutze die "5-4-3-2-1" Grounding-Technik',
      '🎯 Setze feste "Grübelzeiten" (10 Min/Tag), außerhalb: Stopp!',
      '💭 Lerne kognitive Umstrukturierung',
    ],
    'evening_relaxation': [
      '📵 Erstelle eine "Digital Sunset" (keine Screens ab 20 Uhr)',
      '☕ Trinke beruhigenden Tee (Kamille, Lavendel)',
      '📖 Lies entspannende Literatur',
      '🎵 Höre beruhigende Musik oder Naturgeräusche',
      '🧘‍♀️ Mache abendliche Entspannungsrituale (Yoga, Meditation)',
    ],
    'digital_distraction': [
      '📱 Nutze App-Blocker während Fokuszeiten',
      '🔕 Deaktiviere nicht-essentielle Benachrichtigungen',
      '⏰ Setze feste Zeiten für Social Media (z.B. 30 Min/Tag)',
      '📵 Handy-freie Zonen: Schlafzimmer, Esstisch',
      '🎯 Probiere "Digital Detox" Wochenenden',
    ],
    'focus': [
      '🍅 Nutze die Pomodoro-Technik (25 Min Fokus, 5 Min Pause)',
      '🎧 Probiere binaurale Beats oder Focus-Musik',
      '☕ Optimiere deine Koffein-Einnahme (nicht zu viel!)',
      '📝 Erstelle To-Do-Listen zur mentalen Entlastung',
      '🧘‍♀️ Meditiere täglich 10 Minuten für besseren Fokus',
    ],
    'breaks': [
      '⏰ Stelle Timer für regelmäßige Pausen (alle 60-90 Min)',
      '🚶‍♀️ Gehe kurz spazieren in der Pause',
      '👀 Praktiziere die 20-20-20 Regel (alle 20 Min, 20 Sek auf 20 Fuß Entfernung schauen)',
      '🧘‍♀️ Mache Mini-Meditationen (2-3 Min)',
      '💆‍♀️ Dehne Nacken und Schultern',
    ],
    'breathing': [
      '🫁 Lerne 4-7-8 Atmung (4 ein, 7 halten, 8 aus)',
      '🧘‍♀️ Praktiziere Box-Breathing (4-4-4-4)',
      '📱 Nutze Atem-Apps wie "Breathwrk" oder "Prana Breath"',
      '⏰ Mache 3x täglich 5 Atemübungen',
      '🎯 Verbinde Atmung mit Alltagsaktivitäten (vor Meetings, etc.)',
    ],
    'cognitive_function': [
      '🧠 Spiele Gedächtnisspiele oder Rätsel',
      '💧 Trinke ausreichend Wasser',
      '😴 Priorisiere guten Schlaf (7-9 Stunden)',
      '🥗 Omega-3-reiche Ernährung (Fisch, Nüsse)',
      '🏃‍♀️ Regelmäßige Bewegung fördert Gehirnleistung',
    ],
    'mental_breaks': [
      '🌳 Schaue regelmäßig aus dem Fenster in die Natur',
      '💭 Erlaube dir bewusstes Tagträumen',
      '🎨 Nutze Pausen für kreative Auszeiten',
      '🧘‍♀️ Praktiziere "Nichtstun" - einfach sein',
      '☁️ Beobachte Wolken oder höre dem Regen zu',
    ],
  };

  // Emotionale Entspannung - Unterkategorien
  static const Map<String, List<String>> emotionalRecommendations = {
    'emotional_regulation': [
      '🧘‍♀️ Lerne die STOP-Technik (Stop, Take a breath, Observe, Proceed)',
      '📝 Führe ein Emotions-Tagebuch',
      '🎭 Nutze emotionale Regulationstechniken (PMR, Atmung)',
      '👨‍⚕️ Erwäge emotionszentrierte Therapie',
      '🧠 Lerne über das "Window of Tolerance" Konzept',
    ],
    'emotional_awareness': [
      '📊 Nutze ein Gefühlsrad zur Identifikation von Emotionen',
      '📝 Benenne deine Gefühle schriftlich',
      '🎯 Praktiziere tägliche Emotions-Check-ins',
      '🧘‍♀️ Body-Scan: Wo fühlst du Emotionen im Körper?',
      '📚 Lese über emotionale Intelligenz',
    ],
    'coping': [
      '🎨 Finde gesunde Coping-Mechanismen (Kunst, Sport, Musik)',
      '📞 Baue ein Support-Netzwerk auf',
      '🧘‍♀️ Lerne Achtsamkeit im Umgang mit Gefühlen',
      '💭 Praktiziere Selbstmitgefühl statt Selbstkritik',
      '📚 Lese über DBT (Dialektisch-Behaviorale Therapie)',
    ],
    'support': [
      '👥 Suche dir einen Therapie- oder Coaching-Partner',
      '💬 Tritt einer Support-Gruppe bei',
      '👨‍👩‍👧‍👦 Öffne dich vertrauensvollen Freunden/Familie',
      '📱 Nutze emotionale Support-Hotlines wenn nötig',
      '🤝 Baue tiefere Freundschaften auf',
    ],
    'overwhelm': [
      '⏸️ Lerne "Pause-Knöpfe": Kurz innehalten bei Überforderung',
      '🧘‍♀️ Praktiziere Grounding-Techniken (5-4-3-2-1)',
      '📊 Reduziere Stressoren wo möglich',
      '🎯 Lerne "Nein" zu sagen',
      '💆‍♀️ Schaffe Rückzugsorte für dich',
    ],
    'self_compassion': [
      '💝 Sprich mit dir wie mit einem guten Freund',
      '🪞 Praktiziere liebevolle Selbstgespräche',
      '📝 Schreibe dir selbst mitfühlende Briefe',
      '🧘‍♀️ Mache Loving-Kindness Meditation',
      '📚 Lies "Selbstmitgefühl" von Kristin Neff',
    ],
    'journaling': [
      '📓 Beginne mit 5 Minuten freiem Schreiben täglich',
      '📝 Nutze strukturierte Journal-Prompts',
      '🌅 Morgenseiten: 3 Seiten Gedankenstrom',
      '🌙 Abend-Reflexion: Was lief gut? Was habe ich gelernt?',
      '💭 Probiere verschiedene Journaling-Stile (Bullet, gratitude, etc.)',
    ],
    'resilience': [
      '💪 Baue emotionale Resilienz durch kleine Herausforderungen',
      '🎯 Fokussiere auf das, was du kontrollieren kannst',
      '🙏 Praktiziere Dankbarkeit auch in schweren Zeiten',
      '👥 Pflege unterstützende Beziehungen',
      '📚 Lerne über Growth Mindset',
    ],
  };

  // Soziale Entspannung - Unterkategorien
  static const Map<String, List<String>> socialRecommendations = {
    'group_comfort': [
      '👥 Starte mit kleinen Gruppen (2-3 Personen)',
      '🎯 Bereite Gesprächsthemen vor',
      '🧘‍♀️ Nutze Atemtechniken bei sozialer Angst',
      '📈 Steigere dich graduell zu größeren Gruppen',
      '🎭 Erwäge soziale Kompetenz-Trainings',
    ],
    'boundaries': [
      '🛑 Übe "Nein" zu sagen ohne Schuldgefühle',
      '📝 Definiere deine persönlichen Grenzen schriftlich',
      '💬 Kommuniziere Grenzen klar und freundlich',
      '🎯 Priorisiere: Welche sozialen Aktivitäten sind dir wirklich wichtig?',
      '📚 Lies über assertive Kommunikation',
    ],
    'recharge': [
      '🔋 Plane bewusst Allein-Zeit ein',
      '🚪 Schaffe Rückzugsorte zuhause',
      '📅 Balance: soziale Aktivität + Erholungszeit',
      '🧘‍♀️ Nutze Allein-Zeit für Selbstpflege',
      '💭 Akzeptiere dein Bedürfnis nach Rückzug',
    ],
    'acceptance': [
      '💬 Übe authentische Kommunikation',
      '🔍 Suche Menschen, die dich wertschätzen',
      '🎭 Sei verletzlich und teile dein wahres Ich',
      '🚪 Distanziere dich von toxischen Beziehungen',
      '💝 Akzeptiere dich selbst zuerst',
    ],
    'conflicts': [
      '💬 Lerne gewaltfreie Kommunikation (GFK)',
      '🎯 Adressiere Konflikte früh, nicht aufstauen',
      '👂 Praktiziere aktives Zuhören',
      '🤝 Suche Win-Win-Lösungen',
      '📚 Bilde dich in Konfliktlösung weiter',
    ],
    'authenticity': [
      '🎭 Übe, deine wahre Meinung zu äußern',
      '💭 Reflektiere: Wann verstelle ich mich und warum?',
      '🎯 Finde Umgebungen, wo du du selbst sein kannst',
      '📝 Kläre deine Werte und lebe danach',
      '👥 Umgib dich mit authentischen Menschen',
    ],
    'quality_time': [
      '📅 Plane feste Termine mit wichtigen Menschen',
      '📱 Phone-free Zeit bei Treffen',
      '🎯 Qualität vor Quantität',
      '💬 Führe tiefere Gespräche (nutze Deep-Talk-Fragen)',
      '🎨 Unternimm gemeinsame Aktivitäten',
    ],
    'boundary_setting': [
      '🗣️ Übe klare Kommunikation deiner Bedürfnisse',
      '🎯 Lerne, zwischen deinen und fremden Bedürfnissen zu unterscheiden',
      '💪 Starte mit kleinen Grenzen und steigere dich',
      '📚 Lies "Grenzen setzen" von Anne Katherine',
      '👨‍⚕️ Erwäge Coaching für besseres Boundary-Setting',
    ],
  };

  // Spirituelle Entspannung - Unterkategorien
  static const Map<String, List<String>> spiritualRecommendations = {
    'connection': [
      '🌳 Verbringe regelmäßig Zeit in der Natur',
      '🙏 Finde eine spirituelle Gemeinschaft, die zu dir passt',
      '📿 Entwickle Rituale, die dich mit dem Größeren verbinden',
      '🧘‍♀️ Praktiziere Meditation zur Verbindung',
      '📚 Erforsche verschiedene spirituelle Traditionen',
    ],
    'nature': [
      '🌲 Plane wöchentliche Waldbesuche (Waldbaden)',
      '🌅 Beobachte Sonnenauf- oder -untergänge',
      '🌿 Pflege Pflanzen oder starte einen Garten',
      '⛰️ Unternimm Wanderungen in natürlicher Umgebung',
      '🏕️ Verbringe Zeit beim Camping',
    ],
    'meaning': [
      '🎯 Definiere deine persönliche Mission',
      '📝 Schreibe über deine Werte und Ziele',
      '💭 Reflektiere: Was gibt mir Sinn?',
      '🤝 Engagiere dich für etwas Größeres (Ehrenamt)',
      '📚 Lies "Mans Search for Meaning" von Viktor Frankl',
    ],
    'gratitude': [
      '📝 Führe ein tägliches Dankbarkeitstagebuch (3 Dinge)',
      '🙏 Praktiziere Dankbarkeits-Meditation',
      '💬 Drücke anderen gegenüber Dankbarkeit aus',
      '📸 Fotografiere Momente, für die du dankbar bist',
      '🌙 Abendliches Dankbarkeits-Ritual vor dem Schlafen',
    ],
    'practices': [
      '🕯️ Schaffe einen Altar oder heiligen Raum zuhause',
      '📿 Etabliere tägliche Morgen- oder Abendrituale',
      '🧘‍♀️ Praktiziere Yoga als spirituelle Praxis',
      '🙏 Probiere verschiedene Meditationsformen',
      '📖 Studiere spirituelle Texte',
    ],
    'values': [
      '📝 Schreibe deine Top 5 Werte auf',
      '🎯 Überprüfe Entscheidungen anhand deiner Werte',
      '💭 Reflektiere: Leben meine Handlungen meine Werte?',
      '🗓️ Plane werteorientierte Aktivitäten',
      '📚 Mache ein Values-Clarification Worksheet',
    ],
    'silence': [
      '🧘‍♀️ Beginne mit 5 Minuten täglicher Stille',
      '🚶‍♀️ Mache schweigende Spaziergänge',
      '🔕 Schaffe stille Momente im Alltag',
      '🏔️ Besuche stille Orte (Kloster, Natur)',
      '📅 Plane jährlich ein Schweigeretreats',
    ],
    'awe': [
      '🌌 Beobachte den Sternenhimmel',
      '🎨 Besuche Museen oder Kunstgalerien',
      '🎵 Höre bewegende Musik',
      '📚 Lies inspirierende Texte oder Poesie',
      '⛰️ Besuche beeindruckende Naturorte',
    ],
  };

  // Sensorische Entspannung - Unterkategorien
  static const Map<String, List<String>> sensoryRecommendations = {
    'sound_sensitivity': [
      '🎧 Nutze Noise-Cancelling Kopfhörer',
      '🔇 Schaffe ruhige Rückzugsorte',
      '🎵 Nutze Weißes Rauschen oder pink noise',
      '🏠 Investiere in Schalldämmung',
      '🧘‍♀️ Praktiziere Geräusch-Desensibilisierung',
    ],
    'smell': [
      '🌸 Nutze Lavendel für besseren Schlaf',
      '🍊 Zitrusdüfte für Energie und Wachheit',
      '🌲 Eukalyptus oder Pfefferminz für Klarheit',
      '💐 Stelle frische Blumen auf',
      '🕯️ Verwende ätherische Öle im Diffuser',
    ],
    'light_sensitivity': [
      '😎 Trage bei hellem Licht eine Sonnenbrille',
      '💡 Nutze warmes, dimmbares Licht zuhause',
      '📱 Blaulichtfilter auf allen Geräten',
      '🌙 Verdunkle das Schlafzimmer vollständig',
      '🕶️ Schaffe lichtarme Entspannungsräume',
    ],
    'touch': [
      '🧶 Umgib dich mit weichen, angenehmen Texturen',
      '🛋️ Investiere in bequeme Möbel und Kissen',
      '👕 Trage Kleidung aus natürlichen Materialien',
      '🧸 Halte Kuscheltiere oder weiche Objekte bereit',
      '💆‍♀️ Gönn dir regelmäßige Berührung (Massage, Umarmungen)',
    ],
    'sound_therapy': [
      '🎵 Erstelle Playlists für verschiedene Stimmungen',
      '🌊 Nutze Naturgeräusche-Apps',
      '🔔 Probiere Klangschalen-Meditation',
      '🎼 Höre binaurale Beats (Alpha-Wellen für Entspannung)',
      '🎹 Besuche Sound-Healing Sessions',
    ],
    'sensory_indulgence': [
      '🛁 Plane wöchentliche Entspannungsbäder',
      '💆‍♀️ Buche monatliche Massagen',
      '🧖‍♀️ Besuche Sauna oder Spa',
      '🕯️ Schaffe sensorische Rituale (Kerzen, Musik, Düfte)',
      '☕ Genieße bewusst sensorische Momente (Tee, warme Decke)',
    ],
    'overstimulation': [
      '🚪 Schaffe reizarme Rückzugsorte',
      '⏰ Plane regelmäßige "Low-Stimulation" Zeiten',
      '📵 Reduziere digitale Reize',
      '🎧 Nutze Ohrstöpsel in reizintensiven Umgebungen',
      '🧘‍♀️ Praktiziere Sensory Reset Übungen',
    ],
    'taste': [
      '🍽️ Iss langsam und achtsam',
      '📱 Keine Ablenkung beim Essen',
      '👅 Konzentriere dich auf Geschmack und Textur',
      '🍵 Zelebriere Mahlzeiten als Ritual',
      '🎯 Probiere Achtsamkeitsübungen mit Rosinen oder Schokolade',
    ],
  };

  // Kreative Entspannung - Unterkategorien
  static const Map<String, List<String>> creativeRecommendations = {
    'flow': [
      '🎯 Wähle Aktivitäten, die dich herausfordern aber nicht überfordern',
      '⏰ Schaffe längere ununterbrochene Zeitblöcke',
      '📵 Eliminiere Ablenkungen während kreativer Zeit',
      '🎨 Experimentiere mit verschiedenen Medien',
      '📚 Lies "Flow" von Mihaly Csikszentmihalyi',
    ],
    'spontaneity': [
      '📓 Führe ein Ideenbuch für spontane Einfälle',
      '🎨 Halte Kreativmaterial griffbereit',
      '⏰ Plane "Spontanzeit" - Zeit ohne festen Plan',
      '🎭 Improvisiere: Musik, Kochen, Kunst ohne Rezept',
      '💭 Erlaube "unperfekte" Kreationen',
    ],
    'creative_space': [
      '🎨 Richte eine kreative Ecke ein',
      '🗄️ Organisiere Materialien griffbereit',
      '💡 Schaffe inspirierende Atmosphäre',
      '📅 Blockiere feste Kreativ-Zeiten im Kalender',
      '🚪 Kommuniziere "Nicht-Stören" Zeiten',
    ],
    'perfectionism': [
      '🎯 Setze dir "Fertig ist besser als perfekt" als Mantra',
      '🗑️ Schaffe bewusst "schlechte" Kunst',
      '📝 Reflektiere über Fehler als Lernchancen',
      '🎨 Probiere intuitive, prozessorientierte Kunst',
      '💭 Praktiziere Selbstmitgefühl bei Fehlern',
    ],
    'variety': [
      '🎨 Probiere jeden Monat eine neue kreative Form',
      '📚 Nimm verschiedene Kurse (malen, töpfern, tanzen)',
      '🎭 Kombiniere verschiedene Ausdrucksformen',
      '🎯 Erstelle eine Bucket-List kreativer Aktivitäten',
      '💡 Lass dich von anderen Künstlern inspirieren',
    ],
    'emotional_expression': [
      '🎨 Nutze Kunst für emotionales Processing',
      '✍️ Schreibe expressiv über Gefühle',
      '🎵 Erstelle Musik oder Playlists für verschiedene Emotionen',
      '💃 Tanze deine Gefühle aus',
      '📝 Versuche Art Journaling',
    ],
    'hands_on': [
      '🧶 Lerne Stricken, Häkeln oder Nähen',
      '🍳 Koche oder backe kreativ',
      '🏺 Probiere Töpfern oder Keramik',
      '🌱 Starte einen Garten oder Balkon-Pflanzen',
      '🔨 Nimm Holzarbeits- oder Handwerkskurse',
    ],
    'sharing': [
      '📸 Teile Werke auf Social Media oder in Communities',
      '👥 Tritt Kreativ-Gruppen bei',
      '🎨 Organisiere Ausstellungen oder Shows',
      '📚 Nimm an Workshops teil',
      '💬 Hole dir konstruktives Feedback',
    ],
  };

  static List<String> getSpecializedRecommendations(
    RelaxationType type,
    String subCategory,
  ) {
    Map<String, List<String>>? categoryRecommendations;

    switch (type) {
      case RelaxationType.physical:
        categoryRecommendations = physicalRecommendations;
        break;
      case RelaxationType.mental:
        categoryRecommendations = mentalRecommendations;
        break;
      case RelaxationType.emotional:
        categoryRecommendations = emotionalRecommendations;
        break;
      case RelaxationType.social:
        categoryRecommendations = socialRecommendations;
        break;
      case RelaxationType.spiritual:
        categoryRecommendations = spiritualRecommendations;
        break;
      case RelaxationType.sensory:
        categoryRecommendations = sensoryRecommendations;
        break;
      case RelaxationType.creative:
        categoryRecommendations = creativeRecommendations;
        break;
    }

    return categoryRecommendations[subCategory] ?? [];
  }

  static String getSubCategoryMotivation(String subCategory) {
    final motivations = {
      // Körperlich
      'flexibility':
          'Beweglichkeit ist der Schlüssel zu einem schmerzfreien Leben!',
      'tension': 'Löse Verspannungen und fühle dich leicht wie eine Feder.',
      'posture':
          'Eine gute Haltung ist die Basis für körperliches Wohlbefinden.',
      'activity_level': 'Bewegung ist Leben - jeder Schritt zählt!',
      'sleep': 'Guter Schlaf ist die beste Medizin.',
      'energy': 'Tanke Energie für ein vitales Leben!',
      'stretching': 'Dehnung schenkt Freiheit und Leichtigkeit.',
      'awareness': 'Dein Körper spricht mit dir - höre zu!',

      // Mental
      'rumination': 'Befreie deinen Geist von endlosen Gedankenschleifen.',
      'evening_relaxation':
          'Schenke dir friedvolle Abende für besseren Schlaf.',
      'digital_distraction': 'Gewinne deine Aufmerksamkeit zurück!',
      'focus': 'Konzentration ist Macht - trainiere deinen Fokus.',
      'breaks': 'Pausen sind keine Zeitverschwendung, sondern Kraftquellen.',
      'breathing': 'Dein Atem ist dein Anker im Sturm.',
      'cognitive_function': 'Ein klarer Geist ist ein glücklicher Geist.',
      'mental_breaks': 'Gib deinem Geist Raum zum Wandern und Erholen.',

      // Emotional
      'emotional_regulation': 'Du kannst lernen, deine Emotionen zu meistern.',
      'emotional_awareness': 'Kenne deine Gefühle, kenne dich selbst.',
      'coping': 'Gesunde Bewältigung führt zu innerem Frieden.',
      'support': 'Du musst nicht alleine durch schwere Zeiten gehen.',
      'overwhelm': 'Auch in der Überforderung darfst du pausieren.',
      'self_compassion':
          'Behandle dich selbst mit der Liebe, die du verdienst.',
      'journaling': 'Schreiben heilt und klärt den Geist.',
      'resilience': 'Baue innere Stärke für Lebens-Herausforderungen.',

      // Sozial
      'group_comfort': 'Soziale Situationen können leicht und angenehm sein.',
      'boundaries': 'Grenzen sind Selbstliebe, nicht Egoismus.',
      'recharge': 'Alleinzeit ist Nahrung für die Seele.',
      'acceptance': 'Du bist genug, so wie du bist.',
      'conflicts': 'Konflikte können Wachstumschancen sein.',
      'authenticity': 'Dein wahres Ich ist dein größtes Geschenk.',
      'quality_time': 'Echte Verbindung nährt die Seele.',
      'boundary_setting': 'Deine Grenzen sind wertvoll und wichtig.',

      // Spirituell
      'connection': 'Du bist Teil von etwas Größerem.',
      'nature': 'Die Natur ist deine Heimat - kehre zurück.',
      'meaning': 'Dein Leben hat einen einzigartigen Sinn.',
      'gratitude': 'Dankbarkeit verwandelt das Gewöhnliche in Magie.',
      'practices': 'Rituale geben dem Leben Struktur und Tiefe.',
      'values': 'Lebe im Einklang mit deinen tiefsten Überzeugungen.',
      'silence': 'In der Stille findest du Antworten.',
      'awe': 'Staune über die Wunder des Lebens.',

      // Sensorisch
      'sound_sensitivity': 'Schütze dein Gehör und finde deine Ruhe.',
      'smell': 'Düfte können deine Stimmung transformieren.',
      'light_sensitivity':
          'Das richtige Licht schafft die richtige Atmosphäre.',
      'touch': 'Berührung und Textur nähren deine Sinne.',
      'sound_therapy': 'Klang ist Medizin für Körper und Geist.',
      'sensory_indulgence': 'Du verdienst sensorische Freuden.',
      'overstimulation': 'Schütze dich vor Reizüberflutung.',
      'taste': 'Schmecke das Leben in vollen Zügen.',

      // Kreativ
      'flow': 'Flow ist pure Lebensfreude - suche sie!',
      'spontaneity': 'Spontane Kreativität befreit den Geist.',
      'creative_space': 'Ein Raum für Kreativität ist ein Raum für dich.',
      'perfectionism': 'Unperfekte Kreation ist immer noch Kreation.',
      'variety': 'Vielfalt hält Kreativität lebendig.',
      'emotional_expression': 'Kunst heilt, was Worte nicht können.',
      'hands_on': 'Mit den Händen zu schaffen erdet dich.',
      'sharing': 'Deine Kreativität verdient es, gesehen zu werden.',
    };

    return motivations[subCategory] ??
        'Kleine Schritte führen zu großen Veränderungen.';
  }
}
