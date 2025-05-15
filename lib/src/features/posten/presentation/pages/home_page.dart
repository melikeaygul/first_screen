import 'package:first_screen/src/data/database_repository.dart';
import 'package:first_screen/src/data/mock_database_repository.dart';
import 'package:first_screen/src/features/posten/domain/post.dart';
import 'package:first_screen/src/features/posten/presentation/widgest/post_picture.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseRepository databaseRepository = MockDatabaseRepository();

    List<Post> posts = databaseRepository.getPosts();

    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, bottom: 20),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: postPicture(
                creatorName: post.creatorName,
                creatorId: post.creatorId,
                links: post.links.first,
                imageUrls: post.imageUrls.first,
                description: post.description,
              ),
            ),
          );
        },
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 23, right: 23),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             postPicture(),
//             SizedBox(height: 20),
//             postPicture(),
//             SizedBox(height: 20),
//             postPicture(),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
