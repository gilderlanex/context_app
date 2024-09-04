import 'package:flutter/material.dart';

import '../services/word_service.dart';

class GameStatus extends StatelessWidget {
  final int attemps;
  final int hints;
  GameStatus({required this.attemps, required this.hints, super.key});
  final WordService wordService = WordService();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('JOGO:'),
        Text('#${wordService.getGameId()}', style: const TextStyle(fontWeight: FontWeight.bold)),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text('TENTATIVAS:'),
                Text(attemps.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 20),
                Offstage(
                  offstage: hints == 0,
                  child: Row(
                    children: [
                      const Text('DICAS:'),
                      Text(hints.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            )),

        // WelcomeText(),
      ],
    );
  }
}
