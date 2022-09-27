List<int> winningNumber = [12, 6, 34, 22, 41, 9];

void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];

  List<int> ticket2 = [34, 22, 19, 6, 12, 33];

  checkNumbers(ticket2);
}

void checkNumbers(List<int> myNumbers) {
  int matches = 0;
  for (int num in myNumbers) {
    for (int wN in winningNumber) {
      if (num == wN) {
        matches++;
      }
    }
  }
  print(" you got $matches matches");
}
