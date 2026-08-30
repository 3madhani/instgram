import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Instagram'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),

      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.purple,
                        Colors.purple,
                        Colors.red,
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.yellow,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
               Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.purple,
                        Colors.purple,
                        Colors.red,
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.yellow,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
               Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.purple,
                        Colors.purple,
                        Colors.red,
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.yellow,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
               Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.purple,
                        Colors.purple,
                        Colors.red,
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.yellow,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
