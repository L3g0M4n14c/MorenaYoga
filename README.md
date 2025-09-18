# Morena Yoga - Entspannungsanalyse App

Eine crossplatform Flutter-App zur Analyse der 7 Arten der Entspannung und Generierung personalisierter Empfehlungen.

## 📱 Über die App

Morena Yoga hilft Benutzern dabei, ihre Entspannungsbedürfnisse besser zu verstehen durch:

- **Interaktive Umfrage**: 21 Fragen zu den 7 Entspannungsarten
- **Persönliche Analyse**: Identifikation von Defizitbereichen
- **Maßgeschneiderte Empfehlungen**: Konkrete Tipps zur Verbesserung
- **Benutzerfreundliche Oberfläche**: Yoga-inspiriertes Design

## 🧘‍♀️ Die 7 Entspannungsarten

1. **🧘‍♀️ Körperliche Entspannung** - Bewegung, Sport, Yoga
2. **🧠 Mentale Entspannung** - Meditation, Achtsamkeit, Gedankenruhe
3. **❤️ Emotionale Entspannung** - Gefühle, Kreativität, emotionaler Ausgleich
4. **👥 Soziale Entspannung** - Beziehungen, Gemeinschaft, soziale Interaktion
5. **🙏 Spirituelle Entspannung** - Sinnfindung, Verbundenheit, Dankbarkeit
6. **🌿 Umgebungs-Entspannung** - Wohnraum, Natur, harmonische Atmosphäre  
7. **⏰ Zeitliche Entspannung** - Pausen, Zeitmanagement, Work-Life-Balance

## 🚀 Installation und Setup

### Voraussetzungen

1. **Flutter SDK installieren**:
   ```bash
   # macOS mit Homebrew
   brew install --cask flutter
   
   # Oder von https://flutter.dev/docs/get-started/install herunterladen
   ```

2. **Flutter Doctor ausführen**:
   ```bash
   flutter doctor
   ```
   Befolgen Sie die Anweisungen zur Behebung eventueller Probleme.

### App ausführen

1. **Dependencies installieren**:
   ```bash
   cd /Users/marcocorro/Documents/vscode/morenayoga/MorenaYoga
   flutter pub get
   ```

2. **App starten**:
   ```bash
   # Für Android
   flutter run
   
   # Für iOS (nur auf macOS)
   flutter run -d ios
   
   # Für Web
   flutter run -d chrome
   ```

## 🏗️ Projektstruktur

```
lib/
├── main.dart                 # App-Einstiegspunkt
├── theme/
│   └── app_theme.dart       # Design-System und Farbschema
├── models/
│   ├── relaxation_area.dart # Datenmodell für Entspannungsarten
│   └── survey_models.dart   # Umfrage- und Ergebnis-Modelle
├── providers/
│   └── survey_provider.dart # State Management für Umfrage
├── data/
│   ├── survey_questions.dart # Fragenkatalog
│   └── recommendations.dart  # Empfehlungsdatenbank
└── screens/
    ├── welcome_screen.dart      # Startbildschirm
    ├── survey_screen.dart       # Umfrage-Interface
    ├── result_screen.dart       # Ergebnis-Anzeige
    └── recommendations_screen.dart # Persönliche Empfehlungen
```

## 🎨 Features

### ✅ Implementiert
- ✅ Vollständige Flutter-App-Struktur
- ✅ 21 Fragen zu 7 Entspannungsarten  
- ✅ Intelligente Auswertungslogik
- ✅ Personalisierte Empfehlungen
- ✅ Responsive UI mit Material Design 3
- ✅ State Management mit Provider
- ✅ Crossplatform-Kompatibilität (iOS, Android, Web)

### 🔄 Mögliche Erweiterungen
- 📊 Diagramme und Visualisierungen
- 💾 Lokale Datenspeicherung der Ergebnisse
- 🔔 Erinnerungen für Entspannungsaktivitäten
- 📱 Push-Benachrichtigungen
- 🌍 Mehrsprachigkeit
- 🎯 Personalisierte Entspannungspläne
- 📈 Progress-Tracking über Zeit

## 🛠️ Technologie-Stack

- **Flutter** 3.10+ - Crossplatform-Framework
- **Dart** 3.0+ - Programmiersprache  
- **Provider** - State Management
- **Material Design 3** - UI-Framework
- **Shared Preferences** - Lokale Datenspeicherung

## 📱 Unterstützte Plattformen

- 📱 **Android** (API Level 21+)
- 🍎 **iOS** (iOS 12.0+) 
- 🌐 **Web** (Chrome, Firefox, Safari)
- 💻 **Desktop** (Windows, macOS, Linux)

## 🎯 Verwendung

1. **App starten** und auf "Test starten" tippen
2. **21 Fragen beantworten** zu verschiedenen Entspannungsaspekten
3. **Ergebnisse analysieren** - Sehen Sie Ihre Stärken und Defizitbereiche
4. **Empfehlungen erhalten** - Konkrete Tipps für Verbesserungen
5. **Test wiederholen** - Verfolgen Sie Ihren Fortschritt über Zeit

## 🔧 Entwicklung

### Code-Organisation
- **Provider-Pattern** für State Management
- **Modulare Struktur** für einfache Erweiterbarkeit  
- **Responsive Design** für alle Bildschirmgrößen
- **Material Design Guidelines** für konsistente UX

### Anpassungen
Die App kann einfach erweitert werden durch:
- Hinzufügung neuer Fragen in `survey_questions.dart`
- Erweiterung der Empfehlungen in `recommendations.dart`
- Anpassung des Designs in `app_theme.dart`

## 📄 Lizenz

Dieses Projekt ist für persönliche und pädagogische Zwecke erstellt.

---

**Entwickelt mit 💜 für bessere Entspannung und Wohlbefinden**