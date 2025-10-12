# Spezialisierte Fragebögen - Feature Dokumentation

## Übersicht

Das Feature "Spezialisierte Fragebögen" erweitert die MorenaYoga-App um ein zweistufiges Analyse-System, das es Benutzern ermöglicht, tiefer in spezifische Entspannungskategorien einzutauchen.

## Konzept

### Stufe 1: Allgemeiner Fragebogen (21 Fragen)
- Evaluiert alle 7 Entspannungskategorien
- 3 Fragen pro Kategorie
- Identifiziert Defizitbereiche (<60%)
- Gibt allgemeine Empfehlungen

### Stufe 2: Spezialisierter Fragebogen (8 Fragen pro Kategorie)
- Detaillierte Analyse einer spezifischen Kategorie
- Identifiziert Unterkategorien mit Defiziten
- Bietet sehr konkrete, maßgeschneiderte Empfehlungen
- Fokussiert auf umsetzbare Maßnahmen

## Architektur

### Neue Dateien

#### Models
- **`lib/models/survey_models.dart`** (erweitert)
  - Neues Enum: `SurveyType` (general, specialized)
  - Erweiterte `Question`-Klasse mit `surveyType` und `subCategory`
  - Erweiterte `SurveyResult`-Klasse mit spezialisierten Feldern

#### Data
- **`lib/data/specialized_survey_questions.dart`**
  - 8 spezialisierte Fragen für jede der 7 Kategorien
  - Gesamt: 56 neue Fragen
  - Jede Frage hat eine `subCategory` zur genaueren Differenzierung

- **`lib/data/specialized_recommendations.dart`**
  - Detaillierte Empfehlungen für jede Unterkategorie
  - Motivierende Nachrichten
  - Umsetzbare, konkrete Maßnahmen

#### Providers
- **`lib/providers/specialized_survey_provider.dart`**
  - Verwaltet den Ablauf des spezialisierten Fragebogens
  - Berechnet Scores für Unterkategorien
  - Speichert Ergebnisse in der History

#### Screens
- **`lib/screens/category_selection_screen.dart`**
  - Zeigt Defizitbereiche aus dem allgemeinen Fragebogen
  - Ermöglicht Auswahl einer Kategorie für vertiefte Analyse
  - Visuelle Hervorhebung empfohlener Bereiche

- **`lib/screens/specialized_survey_screen.dart`**
  - Durchführung des spezialisierten Fragebogens
  - 8 Fragen mit kategoriespezifischer Gestaltung
  - Fortschrittsanzeige

- **`lib/screens/specialized_result_screen.dart`**
  - Detaillierte Ergebnisdarstellung
  - Visualisierung der Unterkategorien-Scores
  - Priorisierte Empfehlungen für schwächste Bereiche

### Erweiterte Dateien

- **`lib/screens/result_screen.dart`**
  - Neuer Button "Spezialisierten Fragebogen starten"
  - Umbenannter Button "Allgemeine Empfehlungen ansehen"

- **`lib/models/survey_history.dart`**
  - Erweitert um `surveyType` und `specializedArea`
  - Speichert beide Fragebogen-Typen im Verlauf

- **`lib/screens/history_screen.dart`**
  - Unterschiedliche Darstellung für allgemeine und spezialisierte Tests
  - Icons zur Differenzierung

## Unterkategorien pro Entspannungstyp

### 1. Körperliche Entspannung (Physical)
- `flexibility` - Beweglichkeit
- `tension` - Muskelverspannungen
- `posture` - Körperhaltung
- `activity_level` - Aktivitätslevel
- `sleep` - Schlafqualität
- `energy` - Energielevel
- `stretching` - Dehnung
- `awareness` - Körperbewusstsein

### 2. Mentale Entspannung (Mental)
- `rumination` - Gedankenkreisen
- `evening_relaxation` - Abendliche Entspannung
- `digital_distraction` - Digitale Ablenkung
- `focus` - Fokus
- `breaks` - Pausen
- `breathing` - Atemübungen
- `cognitive_function` - Kognitive Funktion
- `mental_breaks` - Mentale Auszeiten

### 3. Emotionale Entspannung (Emotional)
- `emotional_regulation` - Emotionsregulation
- `emotional_awareness` - Emotionales Bewusstsein
- `coping` - Bewältigungsstrategien
- `support` - Soziale Unterstützung
- `overwhelm` - Emotionale Überforderung
- `self_compassion` - Selbstmitgefühl
- `journaling` - Journaling
- `resilience` - Resilienz

### 4. Soziale Entspannung (Social)
- `group_comfort` - Wohlfühlen in Gruppen
- `boundaries` - Grenzen
- `recharge` - Aufladen
- `acceptance` - Akzeptanz
- `conflicts` - Konflikte
- `authenticity` - Authentizität
- `quality_time` - Qualitätszeit
- `boundary_setting` - Grenzen setzen

### 5. Spirituelle Entspannung (Spiritual)
- `connection` - Verbindung
- `nature` - Natur
- `meaning` - Lebenssinn
- `gratitude` - Dankbarkeit
- `practices` - Spirituelle Praktiken
- `values` - Werte
- `silence` - Stille
- `awe` - Ehrfurcht

### 6. Sensorische Entspannung (Sensory)
- `sound_sensitivity` - Geräuschempfindlichkeit
- `smell` - Geruchssinn
- `light_sensitivity` - Lichtempfindlichkeit
- `touch` - Tastsinn
- `sound_therapy` - Klangtherapie
- `sensory_indulgence` - Sensorische Verwöhnung
- `overstimulation` - Reizüberflutung
- `taste` - Geschmackssinn

### 7. Kreative Entspannung (Creative)
- `flow` - Flow-Zustand
- `spontaneity` - Spontanität
- `creative_space` - Kreativer Raum
- `perfectionism` - Perfektionismus
- `variety` - Vielfalt
- `emotional_expression` - Emotionaler Ausdruck
- `hands_on` - Handarbeit
- `sharing` - Teilen

## User Flow

1. **Allgemeiner Fragebogen**
   - User absolviert 21-Fragen-Test
   - Ergebnisse zeigen Defizitbereiche (<60%)

2. **Kategorie-Auswahl**
   - User klickt "Spezialisierten Fragebogen starten"
   - Sieht Liste der Defizitbereiche (mit "Empfohlen"-Badge)
   - Wählt eine Kategorie aus

3. **Spezialisierter Fragebogen**
   - 8 gezielte Fragen zur gewählten Kategorie
   - Fortschrittsanzeige
   - Kategoriespezifische Farbgestaltung

4. **Detaillierte Ergebnisse**
   - Gesamtscore für die Kategorie
   - Breakdown nach Unterkategorien
   - Priorisierte, konkrete Empfehlungen
   - Top 3 Fokus-Bereiche

5. **Verlauf**
   - Beide Fragebogen-Typen werden gespeichert
   - Unterschiedliche Icons für Differenzierung
   - Spezialisierte Tests zeigen die analysierte Kategorie

## Empfehlungs-System

### Allgemeine Empfehlungen
- Breite Palette von Maßnahmen
- 5-7 Vorschläge pro Kategorie
- Gut für ersten Überblick

### Spezialisierte Empfehlungen
- Sehr konkrete, umsetzbare Maßnahmen
- Basiert auf Unterkategorien-Scores
- Nur die 3 schwächsten Unterkategorien
- Motivierende Nachrichten
- Fokus auf "Quick Wins"

## Vorteile

1. **Präzision**: Identifiziert genau, wo das Problem liegt
2. **Handlungsfähigkeit**: Konkrete, spezifische Maßnahmen
3. **Motivation**: Fokussierte Empfehlungen statt Überforderung
4. **Progression**: Schrittweise Vertiefung möglich
5. **Personalisierung**: Wirklich auf den User zugeschnitten

## Zukünftige Erweiterungen

- [ ] Fortschritts-Tracking für Unterkategorien über Zeit
- [ ] Vergleich zwischen allgemeinen und spezialisierten Tests
- [ ] Empfehlungen als "Challenges" mit Tracking
- [ ] Erinnerungen für spezifische Maßnahmen
- [ ] Community-Features zum Austausch über Fortschritte
- [ ] Integration mit Yoga-Videos/Übungen
- [ ] Export der Empfehlungen als PDF
- [ ] Push-Notifications für tägliche Impulse

## Technische Details

### Datenstruktur

```dart
SurveyType {
  general,      // 21 Fragen, alle Kategorien
  specialized   // 8 Fragen, eine Kategorie
}

Question {
  String id;
  String question;
  RelaxationType relatedArea;
  List<String> options;
  SurveyType surveyType;
  String? subCategory;  // Für spezialisierte Fragen
}

SurveyResult {
  Map<RelaxationType, double> scores;
  Map<RelaxationType, RelaxationLevel> levels;
  List<RelaxationType> deficitAreas;
  SurveyType surveyType;
  RelaxationType? specializedArea;
  Map<String, double>? subCategoryScores;  // NEU!
}
```

### Scoring-Algorithmus

**Allgemein:**
- 21 Fragen / 7 Kategorien = 3 Fragen pro Kategorie
- Score pro Kategorie = Durchschnitt der 3 Antworten
- Defizit wenn < 60%

**Spezialisiert:**
- 8 Fragen pro Kategorie
- Jede Frage einer Unterkategorie zugeordnet
- Score pro Unterkategorie = Durchschnitt der zugehörigen Antworten
- Empfehlungen für Unterkategorien < 70%
- Priorisierung: niedrigste Scores zuerst

## Testing

Empfohlene Tests:
1. Durchführung beider Fragebogen-Typen
2. Prüfung der Speicherung im Verlauf
3. Verifikation der Empfehlungen
4. UI/UX auf verschiedenen Bildschirmgrößen
5. Rückwärtskompatibilität mit alten History-Einträgen

## Performance

- Spezialisierte Fragen werden lazy-loaded
- Empfehlungen werden on-demand generiert
- Keine Performance-Einbußen durch größere Datenmengen
- History begrenzt auf 50 Einträge

---

**Erstellt am:** 12. Oktober 2025  
**Version:** 1.0  
**Autor:** AI Assistant
