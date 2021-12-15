import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/SudokuDesingModel.dart';

import 'Mess.dart';

class SudokuDesing extends SudokuDesingModel {
  FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _buildGameBody() {
    int gridStateLength = sudokuBoard.length;
    return Column(children: <Widget>[
      AspectRatio(
          aspectRatio: 0.88,
          child: SizedBox.expand(
            child: Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridStateLength,
                ),
                itemBuilder: _buildGridItems,
                itemCount: gridStateLength * gridStateLength,
              ),
            ),
          )),
    ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = sudokuBoard.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => gridItemTapped(x, y, context),
      child: GridTile(
        child: Container(
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    switch (sudokuBoard[x][y]) {
      case 0:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(''),
            ),
          ),
        );
        break;
      case 1:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 2:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 3:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '3',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 4:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '4',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 5:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '5',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 6:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '6',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 7:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '7',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 8:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '8',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      case 9:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? Colors.brown
                          : Colors.brown,
                  width:
                      this.gridOnTap && x == this.tappedX && y == this.tappedY
                          ? 2.0
                          : 0.0),
              color: (x + y) % 2 == 0 ? Colors.white70 : Colors.white,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: x == 0 ? 2.0 : 0.0,
                        color: x == 0 ? Colors.brown : Colors.brown),
                    left: BorderSide(
                        width: y == 0 ? 2.0 : 0.0,
                        color: y == 0 ? Colors.brown : Colors.brown),
                    bottom: BorderSide(
                        width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0,
                        color: x == 2 || x == 5 || x == 8
                            ? Colors.brown
                            : Colors.brown),
                    right: BorderSide(
                        width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0,
                        color: y == 2 || y == 5 || y == 8
                            ? Colors.brown
                            : Colors.brown))),
            child: Center(
              child: Text(
                '9',
                style: TextStyle(
                    fontSize: 20,
                    color: this.gridOnTap &&
                            x == this.tappedX &&
                            y == this.tappedY &&
                            manualCheck
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
        );
        break;
      default:
        return Text(sudokuBoard[x][y].toString());
    }
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  _body() {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          color: _colorFromHex("#2A5983"),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Sudoku",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Mess(context, "", "Oyun Yeniden Başlatılacak",
                                Status.WARNING)
                            .build(() {
                          resetGame();
                          Navigator.pop(context);
                        }, cancel: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 20.0),
                        margin: const EdgeInsets.only(top: 10.0),
                        color: _colorFromHex("#218919"),
                        child: new Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.refresh, color: Colors.white),
                              onPressed: resetGame,
                            ),
                            Text("Yeniden Oyna",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )),
                  Column(
                    children: <Widget>[
                      Text("Kalan Süre", style: TextStyle(color: Colors.white)),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              onStartStopPress();
                            },
                            child: new Icon(
                              playButton ? Icons.pause : Icons.play_arrow,
                              color: _colorFromHex("#218919"),
                            ),
                          ),
                          new Text(
                            countDownText,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              _buildGameBody(),
              Container(
                margin: EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        onTapInsertGrid(1);
                      },
                    )),
                    GestureDetector(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        onTapInsertGrid(2);
                      },
                    )),
                    GestureDetector(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        onTapInsertGrid(3);
                      },
                    )),

                  ],
                ),

              ),
              Container(
                margin:EdgeInsets.only(top: 1.0) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "4",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(4);
                          },
                        )),
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(5);
                          },
                        )),
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "6",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(6);
                          },
                        )),
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.only(top: 1.0) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "7",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(7);
                          },
                        )),
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "8",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(8);
                          },
                        )),
                    GestureDetector(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                          child: Text(
                            "9",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            onTapInsertGrid(9);
                          },
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 6.0,
                  child: GestureDetector(
                      onTap: () {
                        Mess(context, "", "Bitiğinden Emin Misin?",
                                Status.WARNING)
                            .build(() {
                          Navigator.pop(context);
                          setState(() {
                            try_solving();
                          });
                        }, cancel: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                          width: 48.0,
                          height: 48.0,
                          padding: EdgeInsets.only(top:5),
                          color: _colorFromHex("#218919"),
                          child: new Center(
                            child: Text("Tamamla",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ))),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
