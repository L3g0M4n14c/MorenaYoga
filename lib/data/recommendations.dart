import '../models/relaxation_area.dart';

class RecommendationData {
  static const Map<RelaxationType, List<String>> recommendations = {
    RelaxationType.physical: [
      '🚶‍♀️ Machen Sie täglich einen 20-30 minütigen Spaziergang',
      '🧘‍♀️ Probieren Sie Yoga oder Stretching aus (z.B. 10 Min. am Morgen)',
      '🏊‍♀️ Finden Sie eine Sportart, die Ihnen Freude bereitet',
      '💆‍♀️ Gönnen Sie sich regelmäßige Massagen oder Selbstmassagen',
      '🛁 Nehmen Sie entspannende Bäder mit ätherischen Ölen',
      '🌳 Verbringen Sie Zeit in der Natur und bewegen Sie sich dort',
      '⚡ Bauen Sie kleine Bewegungspausen in Ihren Alltag ein',
    ],
    RelaxationType.mental: [
      '🧘‍♂️ Praktizieren Sie täglich 5-10 Minuten Meditation',
      '📚 Lesen Sie Bücher, die Sie entspannen und inspirieren',
      '🎵 Hören Sie beruhigende Musik oder Naturgeräusche',
      '📱 Nutzen Sie Achtsamkeits-Apps für geführte Meditationen',
      '🌅 Beginnen Sie den Tag mit einer kurzen Achtsamkeitsübung',
      '📝 Führen Sie ein Dankbarkeitstagebuch',
      '🧠 Praktizieren Sie bewusstes Atmen bei Stress',
      '🎯 Fokussieren Sie sich auf eine Sache zur Zeit',
    ],
    RelaxationType.emotional: [
      '🎨 Nutzen Sie kreative Ausdrucksformen (Malen, Musik, Schreiben)',
      '😊 Lachen Sie bewusst mehr - schauen Sie Komödien oder treffen Sie lustige Menschen',
      '💭 Akzeptieren Sie Ihre Gefühle, ohne sie zu bewerten',
      '🤗 Suchen Sie körperlichen Kontakt (Umarmungen, Kuscheln mit Haustieren)',
      '🎭 Probieren Sie Rollenspiele oder Theater aus',
      '💪 Lernen Sie Techniken zur emotionalen Regulation',
      '🌈 Umgeben Sie sich mit Farben und Dingen, die Sie glücklich machen',
      '📱 Begrenzen Sie negative Medienkonsum',
    ],
    RelaxationType.social: [
      '👥 Planen Sie regelmäßige Treffen mit Freunden und Familie',
      '🎉 Nehmen Sie an Gruppenaktivitäten oder Kursen teil',
      '🤝 Engagieren Sie sich ehrenamtlich in der Gemeinschaft',
      '💬 Führen Sie tiefere Gespräche statt Small Talk',
      '🌐 Treten Sie Interessensgruppen oder Vereinen bei',
      '🎲 Spielen Sie Gesellschaftsspiele mit anderen',
      '🍽️ Teilen Sie Mahlzeiten mit anderen Menschen',
      '🚶‍♀️ Unternehmen Sie gemeinsame Aktivitäten in der Natur',
    ],
    RelaxationType.spiritual: [
      '🙏 Entwickeln Sie eine tägliche Dankbarkeitspraxis',
      '🌅 Verbringen Sie bewusst Zeit in der Natur',
      '📿 Probieren Sie Meditation oder Gebet aus',
      '📖 Lesen Sie spirituelle oder philosophische Texte',
      '🕯️ Schaffen Sie einen friedlichen Raum für Reflexion',
      '🌌 Betrachten Sie den Sternenhimmel und reflektieren Sie über das Leben',
      '🎯 Definieren Sie Ihre Werte und leben Sie danach',
      '💫 Praktizieren Sie Vergebung - sich selbst und anderen gegenüber',
    ],
    RelaxationType.sensory: [
      '� Verwenden Sie ätherische Öle und Düfte zur Entspannung',
      '� Hören Sie bewusst entspannende Musik oder Naturgeräusche',
      '�‍♀️ Gönnen Sie sich regelmäßige Massagen oder Selbstmassagen',
      '🛁 Nehmen Sie warme Bäder mit beruhigenden Zusätzen',
      '� Beobachten Sie bewusst schöne Momente (Sonnenaufgang, Natur)',
      '� Praktizieren Sie achtsame Berührung und Tastübungen',
      '🧘‍♀️ Nutzen Sie Aromatherapie für tiefe Entspannung',
      '🌿 Umgeben Sie sich mit angenehmen Texturen und Materialien',
    ],
    RelaxationType.creative: [
      '🎨 Malen, zeichnen oder skizzieren Sie regelmäßig',
      '✍️ Führen Sie ein kreatives Tagebuch oder schreiben Sie Geschichten',
      '🧶 Probieren Sie handwerkliche Tätigkeiten wie Stricken oder Häkeln',
      '📸 Entdecken Sie die Fotografie als kreativen Ausdruck',
      '� Nehmen Sie an Theater- oder Improvisationsgruppen teil',
      '🎼 Lernen Sie ein Musikinstrument oder singen Sie',
      '🏺 Probieren Sie Töpfern oder andere handwerkliche Künste',
      '💃 Tanzen Sie - alleine oder in der Gruppe',
    ],
  };

  static List<String> getRecommendations(RelaxationType type) {
    return recommendations[type] ?? [];
  }

  static String getMotivationalMessage(RelaxationType type) {
    switch (type) {
      case RelaxationType.physical:
        return 'Ihr Körper ist Ihr Tempel - behandeln Sie ihn mit Liebe und Aufmerksamkeit!';
      case RelaxationType.mental:
        return 'Ein ruhiger Geist ist die Quelle innerer Stärke und Klarheit.';
      case RelaxationType.emotional:
        return 'Ihre Gefühle sind wertvoll - lernen Sie, sie zu verstehen und zu schätzen.';
      case RelaxationType.social:
        return 'Echte Verbindungen zu anderen Menschen nähren die Seele.';
      case RelaxationType.spiritual:
        return 'Die Verbindung zu etwas Größerem gibt Ihrem Leben Sinn und Tiefe.';
      case RelaxationType.sensory:
        return 'Ihre Sinne sind das Tor zu tiefer Entspannung und bewusster Wahrnehmung.';
      case RelaxationType.creative:
        return 'Kreativität ist der Schlüssel zu innerer Freiheit und authentischem Selbstausdruck.';
    }
  }
}
