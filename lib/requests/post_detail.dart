import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/requests/post.dart';
import 'package:http/http.dart' as http;

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.id});
  final int id;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool isLoading = true;
  late Post post;

  @override
  void initState() {
    super.initState();
    getPostById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(post.content),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> getPostById() async {
    try {
      final result = await http
          .get(Uri.parse("https://jsonplaceholder.org/posts/${widget.id}"));
      // print(result.statusCode);

      // print(result.body); // json string
      final data = jsonDecode(result.body);
      // print(data);
      // print(data.runtimeType);

      setState(() {
        post = Post.fromMap(data);
        isLoading = false;
      });
      // print(post.title);
    } catch (e) {
      // print("error $e");
    }
  }
}
