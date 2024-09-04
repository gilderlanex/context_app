import 'package:context_app/components/word_list.dart';
import 'package:flutter/material.dart';
import '../components/Result.dart';
import '../components/game_status.dart';
import '../components/welcome_text.dart';
import '../components/word_item_list.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';
import 'dart:developer' as developer;

import '../services/word_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController inputController = TextEditingController();
  final WordService wordService = WordService();

  int attempts = 0;
  int hints = 0;
  String currentWord = '';
  int currentDistance = 0;
  bool isRepeatedWord = false;
  List<WordItem> wordList = [];
  List<WordItem> hintsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "CONTEXTO",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: AppColors.defaultBackground,
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline, color: Colors.black),
            onPressed: getHints
          ),
        ],
      ),
      body: Padding(
        padding: Dimensions.defaultPadding,
        child: ListView(
          children: [
            GameStatus(attemps: attempts, hints: hints),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                onSubmitted: computeWordEntry,
                controller: inputController,
                decoration: const InputDecoration(
                  hintText: 'Digite uma palavra',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            Offstage(
                offstage: attempts == 0,
                child: Result(distance: currentDistance, word: currentWord)),
            Offstage(
              offstage: attempts != 0|| hints != 0,
              child: const WelcomeText(),
            ),
            Offstage(offstage: attempts == 0, child: WordList(items: wordList)),
            Offstage(offstage: hintsList == 0, child: WordList(items: hintsList)),
          ],
        ),
      ),
    );
  }

  void computeWordEntry(String wordTyped) async {
    isRepeatedWord = false;
    if (wordAlreadyExists(wordTyped)) {
      currentDistance = -2;
      currentWord = wordTyped;
      setState(() {});
      inputController.clear();
    } else {
      final distance = await wordService.getDistance(wordTyped);
      setState(() {
        currentWord = wordTyped;
        currentDistance = distance.distance;
        if (wordService.isValid(currentDistance)) {
          wordList.add(WordItem(distance.distance, wordTyped));
          wordList
              .sort((word1, word2) => word1.distance.compareTo(word2.distance));
        }
        attempts++;
        inputController.clear();
      });
      developer.log(
          'Usuário digitou: $wordTyped e foi a tentativa: $attempts, tem ${wordList.length} itens na lista');
    }
  }

  bool wordAlreadyExists(String word) {
    bool alreadyExists = false;
    for (final item in wordList) {
      if (item.word.contains(word)) {
        alreadyExists = true;
      }
    }
    return alreadyExists;
  }

  void getHints() async {
    final distance = await wordService.getHints();
    setState(() {
      currentDistance = distance.distance;
      if (wordService.isValid(currentDistance)) {
        hintsList.add(WordItem(distance.distance, distance.word));
        hintsList
            .sort((word1, word2) => word1.distance.compareTo(word2.distance));

      }
      hints++;
    });
  }
}
