import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/data_fetching/post.dart';
import 'package:flutter_course/data_fetching/post_detail.dart';
import 'package:http/http.dart' as http;

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Posts from Internet"),
        actions: const [],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : posts.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.separated(
                  itemCount: posts.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(post.imageUrl),
                      ),
                      title: Text(post.title),
                      subtitle: Text(
                        post.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostDetail(id: post.id)));
                      },
                    );
                  }),
    );
  }

  Future<void> getPosts() async {
    try {
      final result =
          await http.get(Uri.parse("https://jsonplaceholder.org/posts"));
      // print(result.statusCode);
      // print(result.body); // json string
      final data = jsonDecode(result.body) as List;
      // print((data.first as Map)['slug']);

      // print(data.map((p) => Post.fromMap(p)).toList()); // List<Post>

      setState(() {
        posts = data.map((p) => Post.fromMap(p)).toList();
        isLoading = false;
      });
    } catch (e) {
      // print("error $e");
    }
  }
}
