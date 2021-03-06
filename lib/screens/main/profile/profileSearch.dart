import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/screens/main/posts/list.dart';
import 'package:social_app/screens/main/profile/profileSearchBody.dart';
import 'package:social_app/services/posts.dart';
import 'package:social_app/services/user.dart';

class ProfileSearch extends StatefulWidget {
  final String userId;

  ProfileSearch({this.userId});

  @override
  _ProfileSearchState createState() => _ProfileSearchState();
}

class _ProfileSearchState extends State<ProfileSearch> {
  PostService _postService = PostService();
  UserService _userService = UserService();
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.black;
    Color fg = Color(0xff121212);
    Color tg = Color(0xff595959);

    return MultiProvider(providers: [
      StreamProvider.value(value: _postService.getPostsByUser(widget.userId)),
      StreamProvider.value(value: _userService.getUserInfo(widget.userId))
    ], child: ProfileSearchBody(userId: widget.userId));
  }
}
