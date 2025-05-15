import 'package:flutter/material.dart';

void main() => runApp(MyApp());
void fun() {
  print("submitted successfully");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            elevation: 30,
            title: Text(
              "My First App",
            ),
            actions: [Icon(Icons.search), Icon(Icons.more_vert)],
          ),
          body: Column(
            children: [
              Container(
                  color: Colors.red,
                  height: 200,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Calendar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "March,Wednesday",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      Text(
                        "3 Events",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      TextButton(onPressed: (fun), child: Text("Submit"))
                    ],
                  ))
            ],
          )),
    );
  }
}
