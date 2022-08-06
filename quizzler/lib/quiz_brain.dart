import 'question.dart';

class QuizBrain {
  int _questionnumber = 0;
//_"questionbank below is list of Question and Answer
  final List<Question> _questionbank = [
    Question(
        'Real Madrid football club’s biggest rival is Atlético Madrid', false),
    Question("The lighter was invented before the matches", true),
    Question('Infants have more bones than adults.', true),
    Question(
        'Vitamin C is also known by the chemical name of Ascorbic Acid', true),
    Question('Glass is manufactured mainly from processed sand', true),
    Question('The liver is the largest organ in the human body', false),
    Question('Rio de Janeiro is the capital city of Brazil', false),
    Question(
        'Human teeth are just as strong as the teeth of a mature shark', true),
    Question('An ant can lift 1,000 times its body weight.', false),
    Question(
        'Brazil is the only nation to have played in every World Cup finals tournament.',
        true),
    Question(
        'All the kings in a standard deck of cards have a mustache.', false),
    Question(
        'The Harry Potter film, Chamber of Secrets, is the longest film of the Harry Potter movies.',
        true),
    Question('Australia is a country as well as a continent.', true),
    Question('A century consists of one hundred years.', true),
    Question('The largest bone in the human body is the thigh bone. ', true)
  ];

  void nextQuestion() {
    //this method will provide us new Question every time we press true or false
    if (_questionnumber < _questionbank.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestionText() {
    //this mehtod will show question on the screen
    return _questionbank[_questionnumber].questiontext;
  }

  bool getCorrectAnswer() {
    //this method will provide the right Answer of the Questions
    return _questionbank[_questionnumber].answertext;
  }

  bool isFinished() {
    if (_questionnumber >= _questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    if (_questionnumber >= _questionbank.length - 1) {
      _questionnumber = 0;
    }
  }
}
