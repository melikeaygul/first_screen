import 'package:first_screen/src/data/database_repository.dart';
import 'package:first_screen/src/data/mock_database_repository.dart';
import 'package:first_screen/src/features/posten/domain/post.dart';
import 'package:first_screen/src/features/posten/presentation/widgest/post_picture.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Post>> fetchPosts() async {
    final DatabaseRepository databaseRepository = MockDatabaseRepository();
    return await databaseRepository.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, bottom: 20),
      child: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Fehler: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Keine Posts gefunden.'));
          }

          final posts = snapshot.data!;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: postPicture(
                  creatorName: post.creatorName,
                  creatorId: post.creatorId,
                  links: post.links.first,
                  imageUrls: post.imageUrls.first,
                  description: post.description,
                  profilImageUrl:
                      'https://picsum.photos/id/${index + 50}/100/100',
                  initialLikes: post.likes,
                  initialComments: post.comments,
                  initialShares: post.shares,
                ),
              );
            },
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
