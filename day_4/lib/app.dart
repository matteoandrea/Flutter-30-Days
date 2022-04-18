import 'package:day_4/flash_card.dart';
import 'package:day_4/quizz.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Quizz> _quizz = [
    Quizz(question: "aaaaaaa", answer: "bbbbbb"),
    Quizz(question: "cccccccccccccc", answer: "dddddddddd"),
    Quizz(question: "eeeeeee", answer: "ffffffffff"),
    Quizz(question: "gggggggg", answer: "hhhhhhhhhhh"),
  ];

  int _currentQuest = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashCard(text: _quizz[_currentQuest].question),
                    back: FlashCard(text: _quizz[_currentQuest].answer)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: PrevCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev"),
                  ),
                  OutlinedButton.icon(
                    onPressed: NexCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void NexCard() {
    setState(() {
      _currentQuest = _currentQuest + 1 < _quizz.length ? _currentQuest + 1 : 0;
      print(_currentQuest);
    });
  }

  void PrevCard() {
    setState(() {
      _currentQuest =
          _currentQuest - 1 >= 0 ? _currentQuest - 1 : _quizz.length - 1;
    });
  }
}
