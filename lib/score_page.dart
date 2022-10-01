import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  var total1 = 0;
  var total2 = 0;
  var Button = true;
  List<bool> list = [false, false, false, false];
  List<int> score1 = [];
  List<int> score2 = [];

  Widget Score(int i) {
    return Column(
      children: [
        i != 4 ? Text("ROUND $i") : Text("TOTAL"),
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: i != 4
                        ? Text(
                      "${score2[i - 1]}",
                      style: TextStyle(fontSize: 17),
                    )
                        : Text(
                      "${total2}",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: i != 4
                        ? Text(
                      "${score1[i - 1]}",
                      style: TextStyle(fontSize: 17),
                    )
                        : Text(
                      "${total1}",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
            ],
          ),
        ),
        Divider(thickness: 2),
      ],
    );
  }


  Widget Scorenull() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 23),
        Container(
          height: 47,
        ),
      ],
    );
  }

  void Click(bool check) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == false) {
        setState(() {
          list[i] = true;
          if (i == 2) {
            list[i + 1] = true;
            Button = false;
          }
          if (check) {

            score1.add(9);
            score2.add(10);
            total1 += 9;
            total2 += 10;

          } else {

            score1.add(10);
            score2.add(9);
            total1 += 10;
            total2 += 9;

          }
        });
        break;
      }
    }
  }

  Widget _Buttoncolor(){
    return Row(
      children: [
      Expanded(
        child: ElevatedButton(
          onPressed: (){
      for (int i = 0; i < list.length; i++) {
        if (list[i] == false) {
          setState(() {
            Click(true);
          });
          break;
        }
      }
    },
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red[900]),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(width:10.0,),
      Expanded(
        child: ElevatedButton(
          onPressed: (){
            for (int i = 0; i < list.length; i++) {
              if (list[i] == false) {
                setState(() {
                  Click(true);
                });
                break;
              }
            }
    },
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.indigo),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ],
    );
  }

  Widget _Buttonblack(){
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
              onPressed: (){
                for (int i = 0; i < list.length; i++) {
                  if (list[i] == false) {
                    setState(() {
                      Click(true);
                    });
                    break;
                  }
                }
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black),
              child: const Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            ),

            )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OLYMPIC BOXING SCOREING",
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            children: [
          Image.asset(
            "asstes/images/logo.png",
            width: 200.0,
            height: 100.0,
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            height: 20.0,
            child: Text(
              "Women's Light (57-60kg) Semi-final",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.red[900],
                size: 7 * 7,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      children: [
                    Image.asset(
                      "asstes/images/flag_ireland.png",
                      width: 30.0,
                      height: 25.0,
                    ),
                    Text(
                      "  IRELAND",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ]),
                  Text(
                    "HARRINGTON Kellie Anne",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
          Row( mainAxisAlignment: MainAxisAlignment.end,
            children: [
            if(total1>total2)
              Icon(Icons.done,color: Colors.green,),
          ],
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.indigo,
                size: 7 * 7,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                     children: [
                    Image.asset(
                      "asstes/images/flag_thailand.png",
                      width: 30.0,
                      height: 25.0,
                    ),
                    Text(
                      " THAILAND",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ]),
                  Text(
                    "SEESONDEE Sudaporn",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.red[900],
                height: 5.0,
              )),
              Expanded(
                  child: Container(
                color: Colors.indigo,
                height: 5.0,
              )),
            ],
          ),
          SizedBox(height: 10.0,),
            ],
          ),
          Column(
            children: [
          for (int i = 0; i < 4; i++)
            list[i] == false ? Scorenull() : Score(i + 1),
          Button == true ?_Buttoncolor():_Buttonblack(),
    ],
    ),
        ]),
      ),
    );
  }
}
