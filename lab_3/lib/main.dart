import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _FirstPage(),
      initialRoute: "/",
      routes: {
        "/first": (context) => _FirstPage(),
        "/flex" : (context) => _FlexPage(),
        "/grid" : (context) => _GridPage(),
        "/animation" : (context) => _AnimationPage(),
        "/transform" : (context) => _TransformPage(),
        "/sum" : (context) => _SumPage(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
        body: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,)
              ),
              Positioned(
                  top: 50,
                  left: 100,

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,)
              ),
              Positioned(
                  top: 0,
                  left: 150,

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "Квадрат",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),)
              ),
            ],
          ),
        )
    );
  }
}

class _FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
          body: SizedBox(
            height: 300,
            width: 450,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                     ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.white10,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          )

    );
  }
}

class _GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
        body: SizedBox(
          height: 300,
          width: 450,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            padding: const EdgeInsets.all(20.0),
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.purpleAccent,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white10,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ],
          ),
        )

    );
  }
}

class _AnimationPage extends StatefulWidget{

  @override
  State<_AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<_AnimationPage> with SingleTickerProviderStateMixin{
  late Animation<double> scalaAnimation;
  late Animation<double> rotateAnimation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    scalaAnimation = Tween<double>(begin: 300, end: 150).animate(controller)..addListener(() {
      setState(() {

      });
    });
    rotateAnimation = Tween<double>(begin: 0, end: pi / 4.0).animate(controller)..addListener(() {

    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
        body: Center(
          child: Transform.rotate(
            angle: rotateAnimation.value,
            child: Container(
              width: scalaAnimation.value,
              height: 300,
              color: Colors.black,
            ),
          ),
        )
    );
  }
}

class _TransformPage extends StatefulWidget{
  @override
  State<_TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<_TransformPage> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animationPosition;
  late Animation<double> animationSize;

  @override
  void initState() {
   controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
   animationPosition = Tween(begin: 0.0, end: 400.0).animate(controller)..addListener(() {
     setState(() {

     });
   });

   animationSize = Tween(begin: 0.0, end: 300.0).animate(controller)..addListener(() {

   });

   controller.forward();
  }

  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
        body: Transform.translate(
          offset: Offset(100, animationPosition.value),
          child: Container(
            width: animationSize.value,
            height: animationSize.value,
            color: Colors.black,
          ),
        ),
    );
  }
}

class _SumPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SumPageState();

}

class SumPageState extends State<_SumPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int first;
  late int second;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _Menu(),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "first number"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly

                ],
                onChanged: (text){
                  first = int.parse(text);
                },
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "second number"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly

                ],
                onChanged: (text){
                  second = int.parse(text);
                },
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      print(first+second);
                    }
                  },
                  child: const Text("+"),
                ),
              )
            ],
          ),
        )
    );
  }

}

class _Menu extends StatelessWidget implements PreferredSizeWidget{
  const _Menu({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("lab 3"),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "/first",
              child: Text("first"),
            ),
            const PopupMenuItem(
              value: "/flex",
              child: Text("flex"),
            ),
            const PopupMenuItem(
              value: "/grid",
              child: Text("grid"),
            ),
            const PopupMenuItem(
              value: "/animation",
              child: Text("animation"),
            ),
            const PopupMenuItem(
              value: "/transform",
              child: Text("transform"),
            ),
            const PopupMenuItem(
              value: "/sum",
              child: Text("sum"),
            ),
          ],
          onSelected: (String path) {
            Navigator.pushNamed(context, path.toString());
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
