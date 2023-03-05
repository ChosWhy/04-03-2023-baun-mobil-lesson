import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:untitled/demos.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Color? _defaultColor;
  late Color? _backgroundColor;
  
  @override
  void initState() {
    _defaultColor = widget.color;
    print(inspect(_defaultColor));
    ///sayfa daha olusturlmadan önceki tüm olaylar initState içerisinde gerçekleşiyor
    super.initState();
    _backgroundColor = _defaultColor;
    print("sayfa açıldı");
  }

  @override
  void dispose() {
    super.dispose();
    _defaultColor = null;
    print(inspect(_defaultColor));
    print("sayfa kapandı!");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }



  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(inspect(_backgroundColor));
    print(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              _backgroundColor = _defaultColor;
            });
          }, icon: Icon(Icons.cancel)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
                child: Container(
              color: _backgroundColor,
              height: 300,
              child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Demos(),));
                      },
                      child: const Text("sayfa değiştir"))),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(height: 70,color: Colors.red,child: Row(
        children: [
          buildExpanded(color: Colors.red,text: "Red"),
          buildExpanded(color: Colors.green,text: "green"),
          buildExpanded(color: Colors.blue,text: "blue"),
        ],
      ),),
    );
  }

  Expanded buildExpanded({required String text,required Color color}) {
    return Expanded(child: InkWell(
      onTap: (){
        toggleTheCardColor(color);
      },
      child: Container(
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                Text(text),
              ],
            ),
          ),
    ));
  }
  void toggleTheCardColor(Color color){
    setState(() {
      _backgroundColor = color;
    });
  }
}

///metotlar sürekli olarak dışarı cıkması gerek!
///String ifadeler yine stringlerin bulundugu bi classa cıkmalı
///