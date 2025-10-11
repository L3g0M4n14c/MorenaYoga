import '../models/relaxation_area.dart';

class RecommendationData {
  static const Map<RelaxationType, List<String>> recommendations = {
    RelaxationType.physical: [
      '🚶‍♀️ Mach täglich einen 20-30 minütigen Spaziergang',
      '🧘‍♀️ Probiere Yoga oder Stretching aus (z.B. 10 Min. am Morgen)',
      '🏊‍♀️ Finde eine Sportart, die dir Freude bereitet',
      '💆‍♀️ Gönn dir regelmäßige Massagen oder Selbstmassagen',
      '🛁 Nimm entspannende Bäder mit ätherischen Ölen',
      '🌳 Verbringe Zeit in der Natur und bewege dich dort',
      '⚡ Baue kleine Bewegungspausen in deinen Alltag ein',
    ],
    RelaxationType.mental: [
      '🧘‍♂️ Praktiziere täglich 5-10 Minuten Meditation',
      '📚 Lies Bücher, die dich entspannen und inspirieren',
      '🎵 Hör beruhigende Musik oder Naturgeräusche',
      '📱 Nutze Achtsamkeits-Apps für geführte Meditationen',
      '🌅 Beginne den Tag mit einer kurzen Achtsamkeitsübung',
      '📝 Führe ein Dankbarkeitstagebuch',
      '🧠 Praktiziere bewusstes Atmen bei Stress',
      '🎯 Fokussiere dich auf eine Sache zur Zeit',
    ],
    RelaxationType.emotional: [
      '🎨 Nutze kreative Ausdrucksformen (Malen, Musik, Schreiben)',
      '😊 Lache bewusst mehr - schau Komödien oder triff lustige Menschen',
      '💭 Akzeptiere deine Gefühle, ohne sie zu bewerten',
      '🤗 Suche körperlichen Kontakt (Umarmungen, Kuscheln mit Haustieren)',
      '🎭 Probiere Rollenspiele oder Theater aus',
      '💪 Lerne Techniken zur emotionalen Regulation',
      '🌈 Umgib dich mit Farben und Dingen, die dich glücklich machen',
      '📱 Begrenze negativen Medienkonsum',
    ],
    RelaxationType.social: [
      '👥 Plan regelmäßige Treffen mit Freunden und Familie',
      '🎉 Nimm an Gruppenaktivitäten oder Kursen teil',
      '🤝 Engagiere dich ehrenamtlich in der Gemeinschaft',
      '💬 Führe tiefere Gespräche statt Small Talk',
      '🌐 Tritt Interessensgruppen oder Vereinen bei',
      '🎲 Spiel Gesellschaftsspiele mit anderen',
      '🍽️ Teile Mahlzeiten mit anderen Menschen',
      '🚶‍♀️ Unternimm gemeinsame Aktivitäten in der Natur',
    ],
    RelaxationType.spiritual: [
      '🙏 Entwickle eine tägliche Dankbarkeitspraxis',
      '🌅 Verbringe bewusst Zeit in der Natur',
      '📿 Probiere Meditation oder Gebet aus',
      '📖 Lies spirituelle oder philosophische Texte',
      '🕯️ Schaffe einen friedlichen Raum für Reflexion',
      '🌌 Betrachte den Sternenhimmel und reflektiere über das Leben',
      '🎯 Definiere deine Werte und lebe danach',
      '💫 Praktiziere Vergebung - dir selbst und anderen gegenüber',
    ],
    RelaxationType.sensory: [
      '� Verwende ätherische Öle und Düfte zur Entspannung',
      '� Hör bewusst entspannende Musik oder Naturgeräusche',
      '�‍♀️ Gönn dir regelmäßige Massagen oder Selbstmassagen',
      '🛁 Nimm warme Bäder mit beruhigenden Zusätzen',
      '� Beobachte bewusst schöne Momente (Sonnenaufgang, Natur)',
      '� Praktiziere achtsame Berührung und Tastübungen',
      '🧘‍♀️ Nutze Aromatherapie für tiefe Entspannung',
      '🌿 Umgib dich mit angenehmen Texturen und Materialien',
    ],
    RelaxationType.creative: [
      '🎨 Male, zeichne oder skizziere regelmäßig',
      '✍️ Führe ein kreatives Tagebuch oder schreibe Geschichten',
      '🧶 Probiere handwerkliche Tätigkeiten wie Stricken oder Häkeln',
      '📸 Entdecke die Fotografie als kreativen Ausdruck',
      '� Nimm an Theater- oder Improvisationsgruppen teil',
      '🎼 Lerne ein Musikinstrument oder singe',
      '🏺 Probiere Töpfern oder andere handwerkliche Künste',
      '💃 Tanze - alleine oder in der Gruppe',
    ],
  };

  static List<String> getRecommendations(RelaxationType type) {
    return recommendations[type] ?? [];
  }

  static String getMotivationalMessage(RelaxationType type) {
    switch (type) {
      case RelaxationType.physical:
        return 'Dein Körper ist dein Tempel - behandle ihn mit Liebe und Aufmerksamkeit!';
      case RelaxationType.mental:
        return 'Ein ruhiger Geist ist die Quelle innerer Stärke und Klarheit.';
      case RelaxationType.emotional:
        return 'Deine Gefühle sind wertvoll - lerne, sie zu verstehen und zu schätzen.';
      case RelaxationType.social:
        return 'Echte Verbindungen zu anderen Menschen nähren die Seele.';
      case RelaxationType.spiritual:
        return 'Die Verbindung zu etwas Größerem gibt deinem Leben Sinn und Tiefe.';
      case RelaxationType.sensory:
        return 'Deine Sinne sind das Tor zu tiefer Entspannung und bewusster Wahrnehmung.';
      case RelaxationType.creative:
        return 'Kreativität ist der Schlüssel zu innerer Freiheit und authentischem Selbstausdruck.';
    }
  }
}
