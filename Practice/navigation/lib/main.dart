import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),

    );
  }
}

class FirstScreen extends StatelessWidget {
  FirstScreen() {
    Key? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First screen'),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));

              },
              child: Text('Move to the second screen'),
            ),
          ),
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen() {
    Key? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen()));
            },
            child: Text('Move to the first screen'),
          ),
        )
    );
  }
}

