import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children:[
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer('Box 1',Alignment.topLeft),
                  buildContainer('Box 2',Alignment.topRight),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer('Box 3',Alignment.bottomLeft),
                  buildContainer('Box 4',Alignment.bottomRight),
                ],
              ),
          
            ],
          
            ),
            Center(
              child:
                buildContainer('Hello world', Alignment.center,true)
            ),

          ]
        ),
      )
    );
  }

  Container buildContainer(String name,Alignment direction, [ bool boxRadius = false]) {
    return Container(
                decoration: BoxDecoration(
                  borderRadius: boxRadius ? BorderRadius.circular(50.0) : null,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                width: 100.0,
                height: 100.0,
                //color: Colors.yellow,
                alignment: direction,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.dotted,
                      letterSpacing: 2.0,
                  ), // Change to the appropriate style

                ),
              );
  }
}
