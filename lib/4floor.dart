import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:makerthon1/main.dart';

class FourthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FourthScreen(),
    );
  }
}

class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  // Realtime Database의 참조
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  String? leftValue1; // 'left_toilet' 값을 저장할 변수
  String? rightValue1; // 'right_toilet' 값을 저장할 변수
  String? leftValue2; // 'left_tissue'
  String? rightValue2; //'right_tissue'
  String? paperValue1;
  String? trashValue1;

  // 데이터를 저장할 변수
  String? data; // 데이터가 null일 수 있으므로 옵셔널로 변경합니다.

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // Firebase 초기화

    // Firebase에서 데이터를 가져오는 메소드
    database.child('toilet/4floor').onValue.listen((eventToilet) {
      final dataMap = eventToilet.snapshot.value as Map;
      if (dataMap.containsKey('l_toilet')) {
        setState(() {
          leftValue1 = dataMap['l_toilet'].toString();
        });
      }
      if (dataMap.containsKey('r_toilet')) {
        setState(() {
          rightValue1 = dataMap['r_toilet'].toString();
        });
      }
    });

    database.child('tissue/4floor').onValue.listen((eventTissue) {
      final dataMap = eventTissue.snapshot.value as Map;
      if (dataMap.containsKey('l_tissue')) {
        setState(() {
          leftValue2 = dataMap['l_tissue'].toString();
        });
      }
      if (dataMap.containsKey('r_tissue')) {
        setState(() {
          rightValue2 = dataMap['r_tissue'].toString();
        });
      }
    });

    database.child('paper/4floor').onValue.listen((eventTissue) {
      final dataMap = eventTissue.snapshot.value as Map;
      if (dataMap.containsKey('paper1')) {
        setState(() {
          paperValue1 = dataMap['paper1'].toString();
        });
      }
    });

    database.child('trash/4floor').onValue.listen((eventTissue) {
      final dataMap = eventTissue.snapshot.value as Map;
      if (dataMap.containsKey('trash1')) {
        setState(() {
          trashValue1 = dataMap['trash1'].toString();
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // 데이터 로딩 중 및 로딩 실패를 처리하는 로직을 추가합니다.
    Color leftToiletColor = Colors.amber; // Initial color for left toilet box
    if (leftValue1 == '1') {
      leftToiletColor = Colors.red.shade800; // Change to red if leftValue1 is 1
    } else if (leftValue1 == '0') {
      leftToiletColor = Colors.lightGreen; // Change to green if leftValue1 is 0
    }

    Color rightToiletColor = Colors.amber; // Initial color for right toilet box
    if (rightValue1 == '1') {
      rightToiletColor = Colors.red.shade800; // Change to red if rightValue1 is 1
    } else if (rightValue1 == '0') {
      rightToiletColor = Colors.lightGreen; // Change to green if rightValue1 is 0
    }

    Color leftTissueColor = Colors.amber; // Initial color for left tissue box
    if (leftValue2 == '1') {
      leftTissueColor = Colors.red.shade800; // Change to red if leftValue2 is 1
    } else if (leftValue2 == '0') {
      leftTissueColor = Colors.lightGreen; // Change to green if leftValue2 is 0
    }

    Color rightTissueColor = Colors.amber; // Initial color for right tissue box
    if (rightValue2 == '1') {
      rightTissueColor = Colors.red.shade800; // Change to red if rightValue2 is 1
    } else if (rightValue2 == '0') {
      rightTissueColor = Colors.lightGreen; // Change to green if rightValue2 is 0
    }

    Color PaperColor = Colors.amber; // Initial color for right tissue box
    if (paperValue1 == '1') {
      PaperColor = Colors.red.shade800; // Change to red if rightValue2 is 1
    } else if (paperValue1 == '0') {
      PaperColor = Colors.lightGreen; // Change to green if rightValue2 is 0
    }

    Color TrashColor = Colors.amber; // Initial color for right tissue box
    if (trashValue1 == '1') {
      TrashColor = Colors.red.shade800; // Change to red if rightValue2 is 1
    } else if (trashValue1 == '0') {
      TrashColor = Colors.lightGreen; // Change to green if rightValue2 is 0
    }



    // 데이터가 로드되면 UI를 구성합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text('4층'),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: Center(
          child: Stack(
            children: [
          Positioned.fill(
          child: Image.asset(
            'assets/4층 최종 도면.png',
            fit: BoxFit.fill, // 이미지를 화면에 가득 채우도록 설정
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 200, height: 100,),
                Container(
                  color: leftToiletColor, // 동적으로 설정된 색상, // 파란색 배경
                  height: 70, // 높이 조절
                  width: 85, // 가로 전체 너비
                  child: Center(
                    child: Text(
                      'left_toilet', // 텍스트 내용
                      style: TextStyle(
                        color: Colors.white, // 텍스트 색상
                        fontSize: 20, // 텍스트 크기
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60, height: 100,),

                Container(
                  color: rightToiletColor, // Dynamic color based on rightValue1
                  height: 70,
                  width: 85,
                  child: Center(
                    child: Text(
                      'right_toilet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60, height: 100,),
                Container(
                  color: leftTissueColor, // Dynamic color based on rightValue1
                  height: 70,
                  width: 85,
                  child: Center(
                    child: Text(
                      'left_tissue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60, height: 100,),
                Container(
                  color: rightTissueColor, // Dynamic color based on rightValue1
                  height: 70,
                  width: 85,
                  child: Center(
                    child: Text(
                      'right_tissue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 60, height: 100,),
                Container(
                  color: PaperColor, // Dynamic color based on rightValue1
                  height: 70,
                  width: 85,
                  child: Center(
                    child: Text(
                      'paper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 60, height: 100,),
            Container(
              color: TrashColor, // Dynamic color based on rightValue1
              height: 70,
              width: 85,
              child: Center(
                child: Text(
                  'trash',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
            ],
          ),
        ),

      ),
    );
  }
}



