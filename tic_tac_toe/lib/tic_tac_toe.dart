import 'dart:math';

class TicTacToeGame {
  List<String> board = List.filled(9, '');
  var player = 'X';
  var computer = 'O';

  void resetGame() {
    board = List.filled(9, '');
  }

  void makeMove(int index) {
    if (board[index] == '') {
      board[index] = player;
      if (!checkForWin(player) && !isBoardFull()) {
        computerMove();
      }
    }
  }

  void computerMove() {
    var emptyCells = [];
    for (var i = 0; i < board.length; i++) {
      if (board[i] == '') {
        emptyCells.add(i);
      }
    }
    if (emptyCells.isNotEmpty) {
      var randomIndex = emptyCells[Random().nextInt(emptyCells.length)];
      board[randomIndex] = computer;
      checkForWin(computer);
    }
  }

  bool checkForWin(String player) {
      List<List<int>> winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6]              // Diagonals
      ];
      for (var combination in winningCombinations) {
        if (board[combination[0]] == player &&
            board[combination[1]] == player &&
            board[combination[2]] == player) {
          return true; // Player has won
        }
      }
      return false; // No winning combination found
  }

  bool isBoardFull() {
    return !board.contains('');
  }
}
