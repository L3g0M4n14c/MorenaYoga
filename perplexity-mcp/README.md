````markdown
# Perplexity MCP Server

Ein Model Context Protocol Server für tiefgehende Recherche mit Perplexity AI.

Dieser MCP Server integriert die Perplexity API und bietet leistungsstarke Recherche-Tools für Custom Agents in VS Code.

## Features

### Tools

- **`perplexity_search`** - Grundlegende Recherche mit Perplexity
  - Umfassende Antworten mit Quellenangaben
  - Verwandte Fragen für Follow-ups
  - Verschiedene Modelloptionen
  - Zeitfilter für aktuelle Informationen
  
- **`perplexity_compare`** - Vergleichende Recherche
  - Vergleicht zwei Themen oder Konzepte
  - Strukturierte Analyse mit Vor- und Nachteilen
  - Evidenzbasierte Bewertungen
  
- **`perplexity_deep_dive`** - Mehrstufige Tiefenrecherche
  - Automatische Follow-up-Fragen
  - 1-5 Recherche-Runden konfigurierbar
  - Umfassender Bericht mit allen Quellen

## Voraussetzungen

1. **Perplexity API Key** - Holen Sie sich einen API-Key von [perplexity.ai](https://www.perplexity.ai/)
2. **Node.js** - Version 18 oder höher

## Installation

### 1. Dependencies installieren
```bash
npm install
```

### 2. Server kompilieren
```bash
npm run build
```

### 3. API-Key konfigurieren

Erstellen Sie eine `.env` Datei oder setzen Sie die Umgebungsvariable:
```bash
export PERPLEXITY_API_KEY="your-api-key-here"
```

### 4. MCP Server in VS Code einrichten

Fügen Sie den Server zur VS Code MCP-Konfiguration hinzu:

**MacOS:** `~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json`

**Windows:** `%APPDATA%\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json`

```json
{
  "mcpServers": {
    "perplexity-mcp": {
      "command": "node",
      "args": [
        "/Users/marcocorro/Documents/vscode/morenayoga/MorenaYoga/perplexity-mcp/build/index.js"
      ],
      "env": {
        "PERPLEXITY_API_KEY": "your-api-key-here"
      }
    }
  }
}
```

**Wichtig:** Passen Sie den Pfad an Ihren tatsächlichen Speicherort an!

## Verwendung

Nach erfolgreicher Einrichtung stehen Ihrem Custom Agent folgende Tools zur Verfügung:

### Beispiel 1: Einfache Recherche
```
Recherchiere mit Perplexity: Was sind die neuesten Entwicklungen in Flutter 3.24?
```

### Beispiel 2: Vergleich
```
Vergleiche Flutter und React Native in Bezug auf Performance und Entwicklerfreundlichkeit
```

### Beispiel 3: Tiefenrecherche
```
Führe eine Deep-Dive-Recherche über Yoga-App-Monetarisierungsstrategien durch
```

## Verfügbare Modelle

- `llama-3.1-sonar-small-128k-online` - Schnell, kostengünstig
- `llama-3.1-sonar-large-128k-online` - Standard (empfohlen)
- `llama-3.1-sonar-huge-128k-online` - Höchste Qualität

## Development

Für Entwicklung mit Auto-Rebuild:
```bash
npm run watch
```

### Debugging

Since MCP servers communicate over stdio, debugging can be challenging. We recommend using the [MCP Inspector](https://github.com/modelcontextprotocol/inspector), which is available as a package script:

```bash
npm run inspector
```

The Inspector will provide a URL to access debugging tools in your browser.

## Troubleshooting

**Server startet nicht:**
- Prüfen Sie, ob `PERPLEXITY_API_KEY` gesetzt ist
- Stellen Sie sicher, dass der Build-Ordner existiert (`npm run build`)

**Keine Antworten:**
- Überprüfen Sie die API-Key-Gültigkeit
- Checken Sie die Perplexity API-Limits

**VS Code erkennt den Server nicht:**
- Starten Sie VS Code neu nach Konfigurationsänderungen
- Prüfen Sie den Pfad in der MCP-Konfiguration
