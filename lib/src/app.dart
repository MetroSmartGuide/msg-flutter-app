import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '역명을 입력하세요',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [],
            ),
          ),
          body: Column(
            children: [
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(),
              )
            ],
          )),
      onWillPop: () async => false,
    );
  }
}
