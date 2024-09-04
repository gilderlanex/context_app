import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../constants/dimensions.dart';
import '../models/distance_model.dart';

class WordService {
  int _currentTipDistance = Dimensions.distanceDefaultHint;

  Future<Distance> getDistance(String word) async {
    final wordToSend = word.trim();
    var url =
        Uri.parse('https://api.contexto.me/machado/en/game/712/$wordToSend');
    final result = await http.get(url);
    final decoded = jsonDecode(result.body);
    if (result.statusCode == result.statusCode.clamp(200, 299)) {
      // sucesso
      final distanceDecoded = decoded["distance"];
      final Distance distance =
          Distance(distance: distanceDecoded, word: decoded["word"]);
      return distance;
    } else {
      return Distance(distance: -1, word: word);
    }
  }

  Future <Distance> getHints() async {
    String gameId = getGameId();
    var tipDistance = _currentTipDistance;

    var url = Uri.parse('https://api.contexto.me/machado/pt-br/tip/$gameId/$tipDistance');
    final result = await http.get(url);
    final decoded = jsonDecode(result.body);
    if (result.statusCode == result.statusCode.clamp(200, 299)) {
      final distanceDecoded = decoded["distance"];
      final Distance distance =
          Distance(distance: distanceDecoded, word: decoded["word"]);
      _currentTipDistance = (_currentTipDistance / 2).floor();
      return distance;
    } else {
      return Distance(distance: -1, word: '');
    }
  }

  String getGameId() {
    final initialDate = DateTime(2022, 2, 23);
    final currentDate = DateTime.now();
    return currentDate.difference(initialDate).inDays.toString();
  }

  bool isValid(int distance) {
    return distance >= 0;
  }
}
