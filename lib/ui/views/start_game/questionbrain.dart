import 'package:flutter/cupertino.dart';

import 'question.dart';

class TeenTruthBrain {
  int _questionNumber = 0;
  List<Question> _teenTruthBank = [
    Question('Have you ever cheated on a test?', true),
    Question('Have you ever skipped school?', true),
    Question('When was the last time you cleaned your room?', true),
    Question('What is your biggest fear?', true),
    Question('Are you afraid of the dark?', true),
    Question('What is the grossest thing you\'ve done today', true),
    Question('What is the most annoying thing on Earth for you?', true),
    Question(
        'What\'s the dumbest thing you ever said or did, around a boy/girl you liked?',
        true),
    Question('Have you ever peed the bed?', true),
    Question('Have you ever lied about your age?', true),
  ];

  void nextQuestion() async {
    await Future.delayed(Duration(microseconds: 500));
    if (_questionNumber < _teenTruthBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _teenTruthBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _teenTruthBank[_questionNumber].questionDecision;
  }

  // To check the last question in the Bank
  bool isFinished() {
    if (_questionNumber == _teenTruthBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }
}

class TeenDareBrain {
  int _questionNumber = 0;
  List<Question> _teenDareBank = [
    Question('Act like a chicken', true),
    Question('Put all clothes on inside out', true),
    Question('Stop blinking for 30 seconds', true),
    Question('Let someone tickle you for 30 seconds', true),
    Question('Attempt to do 10 pushups', true),
    Question('Stand absolutely still for one minute', true),
    Question('Ask the person on your left to make up a dare for you', true),
    Question('Sing the ABC\'s backward', true),
    Question(
        'Go outside and yell Merry Christmas at the top of your lungs', true),
    Question('Balance a spoon on your nose for 10 second', true),
  ];

  void nextQuestion() async {
    await Future.delayed(Duration(microseconds: 500));
    if (_questionNumber < _teenDareBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _teenDareBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _teenDareBank[_questionNumber].questionDecision;
  }

  // To check the last question in the Bank
  bool isFinished() {
    if (_questionNumber == _teenDareBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }
}

class AdultTruthBrain {
  int _questionNumber = 0;
  List<Question> _adultTruthBank = [
    Question('What turns you on?', true),
    Question('Have you ever lied for a friend? ', true),
    Question('Have you ever cheated on a partner?', true),
    Question('How many people have you kissed?', true),
    Question(
        'What’s the craziest thing you’ve done in front of a mirror?', true),
    Question('Do you have a crush on anyone in this room?', true),
    Question('Are you a virgin?', true),
    Question('Have you ever exchanged nudes?', true),
    Question('Have you ever masturbated?', true),
    Question('Which bad habits do you have?', true),
  ];

  Future<void> nextQuestion() async {
    await Future.delayed(Duration(microseconds: 500));
    if (_questionNumber < _adultTruthBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _adultTruthBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _adultTruthBank[_questionNumber].questionDecision;
  }

  // To check the last question in the Bank
  bool isFinished() {
    if (_questionNumber == _adultTruthBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }
}

class AdultDareBrain {
  int _questionNumber = 0;
  List<Question> _adultDareBank = [
    Question(
        ' Sniff the breath of everyone in the room and say who has the worst',
        true),
    Question('Show everyone your browser history', true),
    Question('Bark for 20 seconds ', true),
    Question('Lift up the smallest person in the room ', true),
    Question('Hug the person next to you', true),
    Question(
        'Have another player blindfold you until it\'s your turn again ', true),
    Question('Let the group decide what your dare should be ', true),
    Question('Tell your darkest secret ', true),
    Question('Dance with no music for 1 minute', true),
    Question('Have a 3- way kiss with two other players', true),
  ];

  Future<void> nextQuestion() async {
    await Future.delayed(Duration(microseconds: 500));
    if (_questionNumber < _adultDareBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _adultDareBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _adultDareBank[_questionNumber].questionDecision;
  }

  // To check the last question in the Bank
  bool isFinished() {
    if (_questionNumber == _adultDareBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> reset() async {
    await Future.delayed(Duration(microseconds: 100));
    return _questionNumber = 0;
  }
}
