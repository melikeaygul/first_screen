import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 10),
        body: Padding(
          padding: EdgeInsets.only(left: 23, right: 23),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.79,
                      foregroundImage: NetworkImage(
                        "https://picsum.photos/id/1/200/300",
                      ),
                    ),
                    SizedBox(width: 4),
                    Column(
                      children: [
                        Text("Sarah Nielsen", style: TextStyle(fontSize: 18)),
                        Text("@sarah_Nielsen"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "https://picsum.photos/id/1/349/271",
                    height: 271,
                    width: 349,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 234, 178, 244),
                  ),
                  height: 93,
                  width: 349,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          IconButton.outlined(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined),
                          ),
                          Icon(Icons.mode_comment_outlined),
                        ],
                      ),

                      Text(
                        "sarah_nielsen: Diese neuen Outfits, sind perfekt für den GYM!",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "Links: Https/:gym.fit.set.de89776",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
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
