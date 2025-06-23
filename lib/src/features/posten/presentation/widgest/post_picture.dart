import 'package:flutter/material.dart';

class postPicture extends StatefulWidget {
  final String creatorName;
  final String creatorId;
  final String imageUrls;
  final String description;
  final String links;
  final String profilImageUrl;
  final int initialLikes;
  final int initialComments;
  final int initialShares;

  const postPicture({
    super.key,
    required this.creatorName,
    required this.creatorId,
    required this.imageUrls,
    required this.description,
    required this.links,
    required this.profilImageUrl,
    required this.initialLikes,
    required this.initialComments,
    required this.initialShares,
  });

  @override
  State<postPicture> createState() => _postPictureState();
}

class _postPictureState extends State<postPicture> {
  bool isLiked = false;
  bool isBookmarked = false;
  int likes = 0;
  bool showComments = false;

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.79,
              foregroundImage: NetworkImage(widget.profilImageUrl),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.creatorName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 70, 11, 92),
                  ),
                ),
                Text(
                  "@${widget.creatorId}",
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 70, 11, 92),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: SizedBox(
            height: 271,
            width: 349,
            child: Image.network(widget.imageUrls, fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            color: Color.fromARGB(255, 234, 178, 244),
          ),
          width: 349,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: toggleLike,
                            icon: Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: isLiked ? Colors.red : Colors.black,
                            ),
                          ),
                          Text(likes.toString(),
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          IconButton(
                            onPressed: toggleComments,
                            icon: const Icon(Icons.mode_comment_outlined),
                          ),
                          Text(widget.initialComments.toString(),
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.keyboard_double_arrow_right_outlined),
                          ),
                          Text(widget.initialShares.toString(),
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: toggleBookmark,
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "${widget.creatorId} : ${widget.description}",
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "Links: ${widget.links}",
                style: const TextStyle(fontSize: 12),
              ),
              if (showComments) ...[
                const SizedBox(height: 8),
                const Text(
                  "Kommentare:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("- Super cool! 🔥"),
                const Text("- Das muss ich auch probieren 😍"),
                const Text("- Woher ist das Outfit?"),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
