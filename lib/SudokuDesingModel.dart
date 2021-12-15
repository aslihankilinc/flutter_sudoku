
import 'package:countdown/countdown.dart';
import 'package:flutter/widgets.dart';
import 'package:sudoku/SudokuHome.dart';
import 'package:collection/collection.dart';
import 'Mess.dart';

abstract class SudokuDesingModel extends State<SudokuHome>{

  List<List<int>> sudokuBoard = [
    [0, 0, 6, 0, 0, 0, 4, 1, 0],
    [0, 0, 1, 0, 7, 0, 0, 2, 9],
    [0, 9, 2, 3, 0, 1, 0, 0, 0],
    [6, 0, 5, 0, 3, 7, 0, 0, 2],
    [0, 0, 8, 2, 0, 5, 1, 0, 0],
    [4, 0, 0, 1, 6, 0, 5, 0, 7],
    [0, 0, 0, 9, 0, 3, 7, 6, 0],
    [9, 8, 0, 0, 1, 0, 3, 0, 0],
    [0, 6, 3, 0, 0, 0, 2, 0, 0]
  ];

  List<List<int>> manualSoal = new List.generate(9, (_) => new List(9));

  bool playButton = false;
  bool gridOnTap = false;
  var tappedX, tappedY;
  var sub;
  CountDown cd;
  String countDownText = "00:15:00";
  bool manualCheck = false;
  var totalSeconds;
  bool success = false;

  int rowcek;
  int colcek;

  static const int UNASSIGNED = 0;
  static const int N = 9;
  static const int SQN = 3;

  FocusNode inputNode = FocusNode();
  void openKeyboard(){
    FocusScope.of(context).requestFocus(inputNode);
  }

  gridItemTapped(int x, int y,BuildContext context){
    setState(() {
      this.gridOnTap = true;
      print(x.toString() + "," + y.toString());
      this.tappedX = x;
      this.tappedY = y;
      print(this.tappedX.toString() + "tap" + this.tappedY.toString());
      //FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  onTapInsertGrid(int v){
    setState(() {
      if(this.countDownText!="00:0:0") {
        if (manualSoal[this.tappedX][this.tappedY] == UNASSIGNED) {
          sudokuBoard[this.tappedX][this.tappedY] = v;
          print(manualSoal.toString());
          print(sudokuBoard.toString());
          if (!isSafe(sudokuBoard, this.tappedX, this.tappedY, v)) {
            manualCheck = true;
          } else
            manualCheck = false;
        }
        print(manualCheck.toString());
      }
    });
  }

  onStartStopPress() {

    if(this.sub == null){
      sub = cd.stream.listen(null);

      sub.onData((Duration d){
        setState((){
          totalSeconds = d.inSeconds;
          int m = totalSeconds ~/ 60;
          int s = totalSeconds - (60*m);
          this.countDownText = "00:" + m.toString() + ":" + s.toString();
        });

      });

      sub.onDone((){
        print("bitti");

        setState((){
          this.playButton = false;
          Mess(context, "Oyun Bitti", "", Status.WARNING).build(() {
            Navigator.pop(context);
          });
        });
      });
    }else{
      if(!this.playButton){
        sub.resume();
      }else{
        sub.pause();
      }
    }

    setState((){
      this.playButton = !this.playButton;
    });

  }

  resetGame(){
    setState(() {
      this.countDownText = "00:15:00";
      cd = new CountDown(new Duration(minutes: 15));
      this.sudokuBoard = [
        [0, 0, 6, 0, 0, 0, 4, 1, 0],
        [0, 0, 1, 0, 7, 0, 0, 2, 9],
        [0, 9, 2, 3, 0, 1, 0, 0, 0],
        [6, 0, 5, 0, 3, 7, 0, 0, 2],
        [0, 0, 8, 2, 0, 5, 1, 0, 0],
        [4, 0, 0, 1, 6, 0, 5, 0, 7],
        [0, 0, 0, 9, 0, 3, 7, 6, 0],
        [9, 8, 0, 0, 1, 0, 3, 0, 0],
        [0, 6, 3, 0, 0, 0, 2, 0, 0]
      ];
      this.playButton = false;
      sub.pause();
      sub = null;
      onStartStopPress();
    });
  }

  bool SudokuSolver(List<List<int>> grid){
    int row = -1;
    int col = -1;
    bool isEmpty = true;

    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        if (grid[i][j] == UNASSIGNED){
          row = i;
          col = j;
          isEmpty = false;
          break;
        }
      }
      if(!isEmpty){
        break;
      }

    }
    if(isEmpty){
      return true;
    }


    for (int num = 1; num <= N; num++)
    {
      if (isSafe(grid, row, col, num))
      {
        grid[row][col] = num;

        if (SudokuSolver(grid))
          return true;
        else
          grid[row][col] = UNASSIGNED;

      }

    }

    return false;

  }


  bool isSafe(List<List<int>> grid, int row, int col, int num)
  {
    return !UsedInRow(grid, row, num) &&
    !UsedInCol(grid, col, num) &&
    !UsedInBox(grid, row - row%SQN , col - col%SQN, num);
  }

  bool UsedInBox(List<List<int>> grid, int boxStartRow, int boxStartCol, int num)
  {
    for (int row = boxStartRow; row < boxStartRow + SQN; row++){
      for (int col = boxStartCol; col < boxStartCol + SQN; col++){
        if (grid[row][col] == num)
          return true;
      }
    }
    return false;
  }

  bool UsedInCol(List<List<int>> grid, int col, int num)
  {
    for (int row = 0; row < N; row++){
      if (grid[row][col] == num)
        return true;
    }
    return false;
  }

  bool UsedInRow(List<List<int>> grid, int row, int num)
  {
    for (int col = 0; col < N; col++){
      if (grid[row][col] == num)
        return true;
    }
    return false;
  }

  bool cek(List<List<int>> grid){

    for(int i=0; i < N; i++){
      for(int j=0; j < N; j++){
        int num = grid[i][j];
        print(!isSafe(grid, i, j, num));
        if (isSafe(grid, i, j, num) == false)
        {
          return false;
        }
      }
    }

    return true;

  }

  try_solving(){
    duplicateBoard(manualSoal, sudokuBoard);
    Function deepEq = const DeepCollectionEquality().equals;

    if (SudokuSolver(sudokuBoard) == true){
      print(sudokuBoard.toString());
      if(cek(sudokuBoard) == true){
        if(deepEq(manualSoal, sudokuBoard)){
          success = true;
          Mess(context, "", "Tebrikler Oyunu Bitirdiniz", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }else{
          success = false;
          Mess(context, "", "Kaybettiniz....", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }

      }else{
        if(deepEq(manualSoal, sudokuBoard)){
          success = true;
          Mess(context, "", "Tamamlayamadınız...", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }
        setState(() {
          this.sudokuBoard = [
            [0, 0, 6, 0, 0, 0, 4, 1, 0],
            [0, 0, 1, 0, 7, 0, 0, 2, 9],
            [0, 9, 2, 3, 0, 1, 0, 0, 0],
            [6, 0, 5, 0, 3, 7, 0, 0, 2],
            [0, 0, 8, 2, 0, 5, 1, 0, 0],
            [4, 0, 0, 1, 6, 0, 5, 0, 7],
            [0, 0, 0, 9, 0, 3, 7, 6, 0],
            [9, 8, 0, 0, 1, 0, 3, 0, 0],
            [0, 6, 3, 0, 0, 0, 2, 0, 0]
          ];

        });
      }
      print("seviye : " + cek(sudokuBoard).toString());


    }
    else{
      print("");
    }

  }

  duplicateBoard(var from, var to){
    for(int i =0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        to[i][j] = from[i][j];
      }
    }
  }

  @override
  void initState() {
    print(sudokuBoard.toString());
    print(manualSoal.toString());
    duplicateBoard(sudokuBoard, manualSoal);
    print(manualSoal.toString());
    cd = new CountDown(new Duration(minutes: 15));
    onStartStopPress();
    super.initState();
  }

}