# Schnellstart: Verlaufs-Feature

## Was wurde hinzugefügt?

Das neue Verlaufs-Feature ermöglicht es Benutzern:
- ✅ Testergebnisse automatisch zu speichern
- ✅ Alle vergangenen Tests anzusehen
- ✅ Ihren Fortschritt über die Zeit zu visualisieren
- ✅ Einzelne Bereiche detailliert zu analysieren
- ✅ Tests zu verwalten (löschen, durchsuchen)

## Neue Dateien

```
lib/
├── models/
│   └── survey_history.dart          # Datenmodelle für Historie
├── services/
│   └── history_storage_service.dart # Speicher-Service
└── screens/
    └── history_screen.dart          # Verlaufs-Bildschirm
```

## Geänderte Dateien

```
lib/
├── providers/
│   └── survey_provider.dart         # + Auto-Speicherung
├── screens/
│   ├── result_screen.dart           # + Verlaufs-Button
│   └── welcome_screen.dart          # + Verlaufs-Button
pubspec.yaml                          # + intl Package
```

## Wie funktioniert es?

### 1. Automatische Speicherung
Wenn ein Benutzer einen Test abschließt, wird das Ergebnis automatisch gespeichert:
```dart
// In survey_provider.dart
_historyService.saveResult(_result!);
```

### 2. Zugriff auf den Verlauf
Zwei Wege zum Verlauf:
- **Welcome Screen**: Historie-Icon oben rechts
- **Result Screen**: Historie-Icon in der App-Bar

### 3. Verlaufs-Ansicht
Der `HistoryScreen` zeigt:
- Übersichtskarte mit Statistiken
- Filter-Chips für einzelne Bereiche
- Liniendiagramme zur Visualisierung
- Liste aller Tests
- Detail-Ansicht mit vollständigen Ergebnissen

### 4. Datenverwaltung
```dart
// Beispiel: History Service verwenden
final service = HistoryStorageService();

// Historie laden
final history = await service.loadHistory();

// Eintrag löschen
await service.deleteEntry(entryId);

// Alle löschen
await service.clearHistory();

// Export
final jsonString = await service.exportHistory();
```

## UI-Komponenten

### Übersichtskarte
- Anzahl der Tests
- Letzter Test-Termin
- Aktueller Gesamtwert
- Veränderung zum vorherigen Test

### Filter
- "Alle" - zeigt Gesamtentwicklung
- Einzelne Bereiche - zeigt spezifische Entwicklung pro Entspannungstyp

### Diagramme
- Custom Painter für Liniendiagramme
- Zeigt bis zu 10 neueste Einträge
- Farbcodierung nach Entspannungstyp

### Historie-Liste
- Chronologische Anordnung (neueste zuerst)
- Kompakte Ansicht mit allen Bereichen
- Tap für Details

## Datenstruktur

### SurveyHistoryEntry
```dart
{
  "id": "1697123456789",
  "timestamp": "2024-10-12T14:30:00.000Z",
  "scores": {
    "physical": 75.0,
    "mental": 80.0,
    "emotional": 65.0,
    "social": 70.0,
    "spiritual": 85.0,
    "sensory": 78.0,
    "creative": 72.0
  },
  "levels": { ... },
  "deficitAreas": ["emotional"],
  "averageScore": 75.0
}
```

## Speicherort

Daten werden lokal auf dem Gerät gespeichert via `shared_preferences`:
- **Key**: `survey_history`
- **Format**: JSON-String
- **Max. Einträge**: 50 (ältere werden automatisch gelöscht)

## Testing

Zum Testen der App:
```bash
# iOS Simulator
flutter run -d iPhone

# Android Emulator
flutter run -d emulator

# Web (falls gewünscht)
flutter run -d chrome
```

## Nächste Schritte

Das Feature ist vollständig implementiert! Du kannst:
1. Die App starten
2. Einen Test absolvieren
3. Den Verlauf öffnen
4. Weitere Tests machen und den Fortschritt sehen

## Hinweise

- Tests werden nur lokal gespeichert (kein Cloud-Sync)
- Maximale Speicherung: 50 Tests
- Bei App-Deinstallation gehen Daten verloren
- Export/Import Feature kann zukünftig hinzugefügt werden
