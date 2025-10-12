import 'package:shared_preferences/shared_preferences.dart';
import '../models/survey_history.dart';
import '../models/survey_models.dart';

class HistoryStorageService {
  static const String _historyKey = 'survey_history';
  static const int _maxHistoryEntries =
      50; // Maximale Anzahl gespeicherter Einträge

  // Speichert ein neues Testergebnis
  Future<void> saveResult(SurveyResult result) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await loadHistory();

    // Erstelle neuen Eintrag
    final entry = SurveyHistoryEntry.fromSurveyResult(result);

    // Füge den neuen Eintrag hinzu
    final updatedEntries = List<SurveyHistoryEntry>.from(history.entries)
      ..add(entry);

    // Behalte nur die neuesten _maxHistoryEntries Einträge
    if (updatedEntries.length > _maxHistoryEntries) {
      updatedEntries.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      updatedEntries.removeRange(_maxHistoryEntries, updatedEntries.length);
    }

    // Speichere die aktualisierte Historie
    final updatedHistory = SurveyHistory(entries: updatedEntries);
    await prefs.setString(_historyKey, updatedHistory.toJsonString());
  }

  // Lädt die gespeicherte Historie
  Future<SurveyHistory> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_historyKey);

    if (jsonString == null || jsonString.isEmpty) {
      return SurveyHistory(entries: []);
    }

    try {
      return SurveyHistory.fromJsonString(jsonString);
    } catch (e) {
      // Falls ein Fehler beim Laden auftritt, gib eine leere Historie zurück
      return SurveyHistory(entries: []);
    }
  }

  // Löscht einen spezifischen Eintrag
  Future<void> deleteEntry(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await loadHistory();

    final updatedEntries =
        history.entries.where((entry) => entry.id != id).toList();

    final updatedHistory = SurveyHistory(entries: updatedEntries);
    await prefs.setString(_historyKey, updatedHistory.toJsonString());
  }

  // Löscht die gesamte Historie
  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  // Exportiert die Historie als JSON-String (für Backup/Export)
  Future<String> exportHistory() async {
    final history = await loadHistory();
    return history.toJsonString();
  }

  // Importiert eine Historie aus einem JSON-String
  Future<bool> importHistory(String jsonString) async {
    try {
      final history = SurveyHistory.fromJsonString(jsonString);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_historyKey, history.toJsonString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
