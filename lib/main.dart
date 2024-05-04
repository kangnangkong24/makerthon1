import 'package:flutter/material.dart';
import '1floor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '2floor.dart';
import '3floor.dart';
import '4floor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 필수
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDp1DEFSlnA0xiy9oiCRPf8ZlslCSFH6nU",
          authDomain: "umpaumpa-pampam57.firebaseapp.com",
          databaseURL: "https://umpaumpa-pampam57-default-rtdb.firebaseio.com",
          projectId: "umpaumpa-pampam57",
          storageBucket: "umpaumpa-pampam57.appspot.com",
          messagingSenderId: "173072849056",
          appId: "1:173072849056:web:fe802870112e500d3c51c5",
          measurementId: "G-1T9VR0MSF9"
      )
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 50,
        title: const Text(
          "UMPAUMPA",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false, // 화살표 아이콘 없애기
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(300, 80),
                  ),
                  child: const Text(
                    "1층",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(300, 80),
                  ),
                  child: const Text(
                    "2층",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(300, 80),
                  ),
                  child: const Text(
                    "3층",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(300, 80),
                  ),
                  child: const Text(
                    "4층",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  