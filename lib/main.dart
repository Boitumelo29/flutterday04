import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterday04/flashcard.dart';
import 'package:flutterday04/flashcard_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcard = [
    Flashcard(
      question: "question",
      answer: "answer",
    ),
    Flashcard(question: "question2", answer: "answer2"),
    Flashcard(question: "question3", answer: "answer3")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashCard(title: _flashcard[_currentIndex].question),
                  back: Card(
                    elevation: 5,
                    child: Center(
                      child: FlashCard(title: _flashcard[_currentIndex].answer),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                      onPressed: showPreCard,
                      icon: const Icon(Icons.chevron_left),
                      label: const Text("Pre")),
                  OutlinedButton.icon(
                      onPressed: showNextCard,
                      icon: const Icon(Icons.chevron_right),
                      label: const Text("next")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcard.length ? _currentIndex + 1 : 0;
    });
  }

  void showPreCard() {
    setState(() {
      _currentIndex =
          _currentIndex - 1 >= 0 ? _currentIndex - 1 : _flashcard.length - 1;
    });
  }
}
