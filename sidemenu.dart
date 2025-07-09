import 'package:flutter/material.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: const Color.fromARGB(255, 215, 255, 217),
              child: Column(
                children: [
                  Text("Menu"),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Card(
                            color: const Color.fromARGB(255, 127, 255, 68),
                            margin: EdgeInsets.all(9),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(Icons.ice_skating),
                                  Text("Tesata"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tesata"),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(50, (index) {
                      return Card(
                        color: Colors.blueAccent,
                        child: Center(child: Text('Item $index')),
                      );
                    }),
                  ),
                ),

                Column(children: [Text("price")]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
