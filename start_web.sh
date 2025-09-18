#!/bin/bash

# Script zum Starten der Morena Yoga App im Web-Browser

echo "🧘‍♀️ Starte Morena Yoga App..."
echo "📱 Die App wird in deinem Standard-Browser geöffnet"

# Erstelle Web-Build-Ordner falls nicht vorhanden
mkdir -p web

# Starte Flutter für Web
flutter run -d web-server --web-port 8080 --web-hostname localhost