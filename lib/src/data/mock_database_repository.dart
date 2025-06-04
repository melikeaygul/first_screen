import 'dart:async';
import 'dart:math';

import '../features/posten/domain/comment.dart';
import 'database_repository.dart';
import '../features/posten/domain/post.dart';
import '../features/userProfil/domain/user_profile.dart';

class MockDatabaseRepository implements DatabaseRepository {
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

  Future<void> _simulateDelay() async {
    final delay = Duration(seconds: Random().nextInt(3) + 1);
    await Future.delayed(delay);
  }

  @override
  Future<void> addComment(Comment comment) async {
    await _simulateDelay();
    for (Post post in _posts) {
      if (post.id == comment.postId) {
        post.comments++;
      }
    }
    _comments.add(comment);
  }

  @override
  Future<void> addPost(Post post) async {
    await _simulateDelay();
    _posts.add(post);
  }

  @override
  Future<void> bookmarkPost(String postId) async {
    await _simulateDelay();
    if (!_bookmarkedPosts.contains(postId)) {
      _bookmarkedPosts.add(postId);
    }
  }

  @override
  Future<List<Comment>> getComments(String postId) async {
    await _simulateDelay();
    return _comments.where((comment) => comment.postId == postId).toList();
  }

  @override
  Future<List<Post>> getPosts() async {
    await _simulateDelay();
    return _posts;
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    await _simulateDelay();
    try {
      return _userProfiles.firstWhere((profile) => profile.id == userId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> likePost(String postId) async {
    await _simulateDelay();
    if (!_likedPosts.contains(postId)) {
      _likedPosts.add(postId);
      for (Post post in _posts) {
        if (post.id == postId) {
          post.likes++;
        }
      }
    }
  }

  @override
  Future<void> removePost(String postId) async {
    await _simulateDelay();
    _posts.removeWhere((post) => post.id == postId);
  }

  @override
  Future<void> unbookmarkPost(String postId) async {
    await _simulateDelay();
    _bookmarkedPosts.remove(postId);
  }

  @override
  Future<void> unlikePost(String postId) async {
    await _simulateDelay();
    if (_likedPosts.remove(postId)) {
      for (Post post in _posts) {
        if (post.id == postId) {
          post.likes = post.likes > 0 ? post.likes - 1 : 0;
        }
      }
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) async {
    await _simulateDelay();
    for (int i = 0; i < _userProfiles.length; i++) {
      if (_userProfiles[i].id == userProfile.id) {
        _userProfiles[i] = userProfile;
        return;
      }
    }
    _userProfiles.add(userProfile);
  }
}
