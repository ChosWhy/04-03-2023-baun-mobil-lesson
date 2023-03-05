import 'package:flutter/material.dart';

class Demos extends StatefulWidget {
  const Demos({Key? key}) : super(key: key);

  @override
  State<Demos> createState() => _DemosState();
}

class _DemosState extends State<Demos> {
  bool controllerDefault = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      controllerDefault = true;
                    });
                  },
                  child: Text("Default",
                      style: Theme.of(context).textTheme.headline5)),
              InkWell(
                  onTap: () {
                    setState(() {
                      controllerDefault = false;
                    });
                  },
                  child: Text("Info",
                      style: Theme.of(context).textTheme.headline5)),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          Card(
            child: Container(
              height: 300,
              width: double.infinity,
              child: Center(
                  child: controllerDefault == true
                      ? const Text("default döndürülüyor")
                      : Text("info döndürülüyor")),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              itemCount: MenuManager.controller.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: index == MenuManager.controller.length -1 ? const EdgeInsets.only(right: 0) : const EdgeInsets.only(right: 10),
                child: customToggleTheColorContainer(index: index),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell customToggleTheColorContainer({required int index}) {
    return InkWell(
                onTap: (){
                  toggleTheBgc(index);
                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: MenuManager.controller[index] == true ? Colors.blue : Colors.white,
                ),
              );
  }

  void toggleTheBgc(int index) {
    return setState(() {
                  if(MenuManager.controller[index] == true){
                    MenuManager.controller[index] = true;
                    for(int i = 0;i< MenuManager.controller.length;i++){
                      if(index != i){
                        MenuManager.controller[i] = false;
                      }
                    }
                  }
                  else{
                    MenuManager.controller[index] = true;
                    for(int i = 0;i< MenuManager.controller.length;i++){
                      if(index != i){
                        MenuManager.controller[i] = false;
                      }
                    }
                  }
                });
  }
}

class MenuManager{
  static List<bool> controller = [true,false,false,false,false,false,];
}