import '../features/posten/domain/comment.dart';
import 'database_repository.dart';
import '../features/posten/domain/post.dart';
import '../features/userProfil/domain/user_profile.dart';

class MockDatabaseRepository implements DatabaseRepository {
  // Simulierte Datenbanken
  final List<Post> _posts = [
    Post(
      id: "Sarah Nielsen",
      createdAt: DateTime.now(),
      description: "Diese neuen Outfits, sind perfekt für den GYM!",
      tags: ["Sommer", "GYY", "Sport"],
      links: ["Https/:gym.fit"],
      imageUrls: ["https://picsum.photos/id/770/200/300"],
      creatorId: "sarah_nielsen",
      creatorProfilePicUrl: "",
      creatorAccountName: "creatorAccountName",
      creatorName: "Sarah Nielsen",
      likes: 15,
      comments: 10,
      shares: 8,
    ),
    Post(
      id: "Anna Laurent",
      createdAt: DateTime.now(),
      description: "It's Summer Time!!",
      tags: ["Summer", "Elegant"],
      links: ["https://summer.fashion.com"],
      imageUrls: ["https://picsum.photos/id/64/200/300"],
      creatorId: "anna.laurent",
      creatorProfilePicUrl: "12",
      creatorAccountName: "creatorAccountName",
      creatorName: "Anna Laurent",
      likes: 33,
      comments: 4,
      shares: 18,
    ),
    Post(
      id: "Luara Lient",
      createdAt: DateTime.now(),
      description: "Rock the House guys! Elegant is the best Style!",
      tags: ["Summer", "Elegant"],
      links: ["https://elegant.lounge.de"],
      imageUrls: ["https://picsum.photos/id/331/200/300"],
      creatorId: "luara_lient",
      creatorProfilePicUrl: "12",
      creatorAccountName: "creatorAccountName",
      creatorName: "Luara Lient",
      likes: 30,
      comments: 1,
      shares: 7,
    ),
  ];
  final List<Comment> _comments = [];
  final List<UserProfile> _userProfiles = [];
  final List<String> _bookmarkedPosts = [];
  final List<String> _likedPosts = [];

  @override
  void addComment(Comment comment) {
    // look for post this comment belongs to
    // and increase the comment count of this post
    for (Post post in _posts) {
      if (post.id == comment.postId) {
        post.comments++;
      }
    }
    // add comment to the list of comments
    _comments.add(comment);
  }

  @override
  void addPost(Post post) {
    _posts.add(post);
  }

  @override
  void bookmarkPost(String postId) {
    if (!_bookmarkedPosts.contains(postId)) {
      _bookmarkedPosts.add(postId);
    }
  }

  @override
  List<Comment> getComments(String postId) {
    List<Comment> postComments = [];
    for (Comment comment in _comments) {
      if (comment.postId == postId) {
        postComments.add(comment);
      }
    }
    return postComments;
  }

  @override
  List<Post> getPosts() {
    return _posts;
  }

  @override
  UserProfile? getUserProfile(String userId) {
    for (UserProfile userProfile in _userProfiles) {
      if (userProfile.id == userId) {
        return userProfile;
      }
    }
    // If no user profile is found, return null
    return null;
  }

  @override
  void likePost(String postId) {
    if (!_likedPosts.contains(postId)) {
      _likedPosts.add(postId);
      // look for post this like belongs to
      // and increase the like count of this post
      for (Post post in _posts) {
        if (post.id == postId) {
          post.likes++;
        }
      }
    }
  }

  @override
  void removePost(String postId) {
    for (Post post in _posts) {
      if (post.id == postId) {
        _posts.remove(post);
      }
    }
  }

  @override
  void unbookmarkPost(String postId) {
    if (_bookmarkedPosts.contains(postId)) {
      _bookmarkedPosts.remove(postId);
    }
  }

  @override
  void unlikePost(String postId) {
    if (_likedPosts.contains(postId)) {
      _likedPosts.remove(postId);
      // look for post this like belongs to
      // and decrease the like count of this post
      for (Post post in _posts) {
        if (post.id == postId) {
          post.likes--;
        }
      }
    }
  }

  @override
  void updateUserProfile(UserProfile userProfile) {
    for (int i = 0; i < _userProfiles.length; i++) {
      if (_userProfiles[i].id == userProfile.id) {
        _userProfiles[i] = userProfile;
      }
    }
  }
}
