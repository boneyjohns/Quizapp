class QuizQuestion {
  final String text;
  final List<String> answer;

  QuizQuestion(this.text, this.answer);
  List getShuffledanswer() {
    final List shuffledlist = List.of(answer);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
