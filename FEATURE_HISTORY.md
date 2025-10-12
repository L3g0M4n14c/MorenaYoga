# Feature: Testergebnis-Verlauf

## Übersicht
Dieses Feature ermöglicht es Benutzern, ihre Testergebnisse über die Zeit zu verfolgen und ihre Fortschritte in den verschiedenen Entspannungsbereichen zu visualisieren.

## Neue Komponenten

### 1. Datenmodelle (`lib/models/survey_history.dart`)

#### `SurveyHistoryEntry`
- Repräsentiert ein einzelnes gespeichertes Testergebnis
- Enthält:
  - `id`: Eindeutige Kennung
  - `timestamp`: Zeitstempel des Tests
  - `scores`: Punktwerte für jeden Entspannungstyp
  - `levels`: Entspannungslevel für jeden Typ
  - `deficitAreas`: Bereiche mit Verbesserungsbedarf
  - `averageScore`: Durchschnittlicher Gesamtwert
- Unterstützt JSON-Serialisierung/Deserialisierung

#### `SurveyHistory`
- Verwaltet eine Sammlung von `SurveyHistoryEntry`-Objekten
- Bietet Hilfsmethoden:
  - `sortedEntries`: Sortiert nach Datum (neueste zuerst)
  - `getRecent(maxCount)`: Holt die neuesten Einträge
  - `getImprovement()`: Berechnet die Verbesserung im Vergleich zum letzten Test
  - `getAverageScores()`: Berechnet durchschnittliche Werte über alle Tests

### 2. Storage Service (`lib/services/history_storage_service.dart`)

#### `HistoryStorageService`
- Verwaltet die persistente Speicherung der Testergebnisse
- Verwendet `shared_preferences` für lokale Datenspeicherung
- Hauptfunktionen:
  - `saveResult(SurveyResult)`: Speichert ein neues Testergebnis
  - `loadHistory()`: Lädt die gespeicherte Historie
  - `deleteEntry(id)`: Löscht einen spezifischen Eintrag
  - `clearHistory()`: Löscht die gesamte Historie
  - `exportHistory()`: Exportiert die Historie als JSON
  - `importHistory(jsonString)`: Importiert eine Historie

**Wichtig**: Es werden maximal 50 Einträge gespeichert. Ältere Einträge werden automatisch gelöscht.

### 3. Verlaufs-Screen (`lib/screens/history_screen.dart`)

#### Funktionen:
- **Übersichtskarte**: Zeigt Gesamtstatistiken an
  - Anzahl der absolvierten Tests
  - Datum des letzten Tests
  - Aktueller Gesamtwert
  - Veränderung zum vorherigen Test

- **Filter-Chips**: Ermöglicht das Filtern nach Entspannungstypen
  - "Alle" zeigt die Gesamtentwicklung
  - Einzelne Bereiche zeigen spezifische Entwicklung

- **Visualisierungen**:
  - Liniendiagramm für einzelne Entspannungsbereiche
  - Gesamt-Liniendiagramm für den Gesamtfortschritt
  - Zeigt bis zu 10 neueste Einträge im Diagramm

- **Historie-Liste**: 
  - Zeigt alle Tests chronologisch
  - Klick auf einen Eintrag zeigt Details
  - Möglichkeit zum Löschen einzelner Einträge

- **Detail-Ansicht**:
  - Vollständige Ergebnisse eines spezifischen Tests
  - Vergleich aller Entspannungsbereiche
  - Lösch-Funktion

## Integration in die App

### 1. Survey Provider (`lib/providers/survey_provider.dart`)
- Wurde erweitert um automatisches Speichern der Testergebnisse
- Nach Abschluss eines Tests wird das Ergebnis automatisch in der Historie gespeichert

### 2. Result Screen (`lib/screens/result_screen.dart`)
- Neuer Button "Verlauf anzeigen" in der App-Bar (Historie-Icon)
- Ermöglicht Navigation zur Verlaufs-Ansicht direkt von den Ergebnissen

### 3. Welcome Screen (`lib/screens/welcome_screen.dart`)
- Neuer Button "Verlauf anzeigen" in der App-Bar
- Ermöglicht Zugriff auf die Historie auch vor dem Start eines neuen Tests

## Verwendete Dependencies

- **intl** (^0.18.1): Für Datumsformatierung
- **shared_preferences** (bereits vorhanden): Für lokale Datenspeicherung

## Benutzerfluss

1. **Test absolvieren**: Benutzer beendet einen Test
2. **Automatische Speicherung**: Ergebnis wird automatisch gespeichert
3. **Verlauf öffnen**: 
   - Über Welcome Screen (Historie-Icon oben rechts)
   - Über Result Screen (Historie-Icon in der App-Bar)
4. **Verlauf ansehen**:
   - Übersicht über alle Tests
   - Filter nach Entspannungstyp
   - Visualisierung der Entwicklung
5. **Details ansehen**: Klick auf einen Test zeigt alle Details
6. **Verwaltung**: 
   - Einzelne Einträge löschen
   - Gesamten Verlauf löschen (über Menü)

## Datenschutz & Speicherung

- Alle Daten werden **lokal** auf dem Gerät gespeichert
- Keine Cloud-Synchronisation
- Benutzer hat volle Kontrolle über seine Daten
- Daten bleiben auch nach App-Neustart erhalten
- Maximale Speicherung: 50 Tests (automatisches Löschen älterer Einträge)

## Zukünftige Erweiterungsmöglichkeiten

1. **Export/Import**: 
   - Backup-Funktion für Benutzer
   - Datenübertragung auf neues Gerät

2. **Erweiterte Statistiken**:
   - Durchschnittliche Verbesserung pro Monat
   - Beste/schlechteste Zeiten
   - Trends und Muster

3. **Erinnerungen**:
   - Periodische Benachrichtigungen für neue Tests
   - Empfohlene Test-Intervalle

4. **Notizen**:
   - Möglichkeit, Notizen zu Tests hinzuzufügen
   - Kontext für spezifische Ergebnisse

5. **Sharing**:
   - Teilen von Fortschritten
   - Export als PDF oder Bild

## UI/UX Highlights

- **Material Design 3**: Moderne, konsistente Oberfläche
- **Farbcodierung**: Jeder Entspannungstyp hat seine eigene Farbe
- **Animationen**: Sanfte Übergänge zwischen Screens
- **Responsive**: Funktioniert auf verschiedenen Bildschirmgrößen
- **Intuitive Navigation**: Klare Zurück-Navigation und Aktionsbuttons
- **Visuelle Darstellung**: Liniendiagramme für besseres Verständnis der Entwicklung
