import 'package:flutter/material.dart';

class postPicture extends StatelessWidget {
  final String creatorName;
  final String creatorId;
  final String imageUrls;
  final String description;
  final String links;

  const postPicture({
    super.key,
    required this.creatorName,
    required this.creatorId,
    required this.imageUrls,
    required this.description,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Padding(
                  padding: const EdgeInsets.only(left: 11, bottom: 3),
                  child: Text(
                    creatorName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 70, 11, 92),
                    ),
                  ),
                ),
                Text(
                  "@$creatorId",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 11, 92),
                  ),
                ),
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
          child: SizedBox(
            height: 271,
            width: 349,
            child: Image.network(imageUrls, fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: const Color.fromARGB(255, 234, 178, 244),
          ),
          height: 100,
          width: 349,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mode_comment_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_double_arrow_right_outlined),
                  ),
                  SizedBox(width: 150),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: Text(
                  "$creatorId : $description",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Links: $links", style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
