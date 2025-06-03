import 'package:first_screen/src/features/posten/presentation/widgest/post_picture.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<String> tags = [
    "Jeans",
    "Leder",
    "Rock",
    "Schwarz",
    "Weiß",
    "Rot",
    "Kleider",
    "Elegant",
    "Date",
    "Beige",
    "Overall",
    "Pullover"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Wichtig bei Tastatur
      body: SafeArea(
        child: SingleChildScrollView(
          // GANZER Inhalt scrollfähig
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Popular tags",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tags.map((tag) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 239, 151, 229).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 100, 14, 100),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              Text(
                "Recents Post",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        width: 349,
                        child: postPicture(
                          creatorName: "User $index",
                          creatorId: "user_$index",
                          imageUrls:
                              "https://picsum.photos/id/${index + 30}/300/200",
                          description: "Ein Beispielbild",
                          links: "www.example.com",
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
