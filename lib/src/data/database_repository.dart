import '../features/posten/domain/comment.dart';
import '../features/posten/domain/post.dart';
import '../features/userProfil/domain/user_profile.dart';

abstract class DatabaseRepository {
  // Posts
  Future<List<Post>> getPosts();
  Future<void> addPost(Post post);
  Future<void> removePost(String postId);
  Future<void> likePost(String postId);
  Future<void> unlikePost(String postId);
  Future<void> bookmarkPost(String postId);
  Future<void> unbookmarkPost(String postId);

  // Comments
  Future<List<Comment>> getComments(String postId);
  Future<void> addComment(Comment comment);

  // User Profile
  Future<UserProfile?> getUserProfile(String userId);
  Future<void> updateUserProfile(UserProfile userProfile);
}
