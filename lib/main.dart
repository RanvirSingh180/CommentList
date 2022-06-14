import 'package:flutter/material.dart';
import 'package:json_demo_3/comment.dart';
import 'list.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment List"),
      ),
      body:const CommentData(),
    );
  }
}

class CommentData extends StatefulWidget {
  const CommentData({Key? key}) : super(key: key);

  @override
  State<CommentData> createState() => _CommentDataState();
}

class _CommentDataState extends State<CommentData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future:
        DefaultAssetBundle.of(context).loadString('json_data/comments.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Comments> comments = parseJson(snapshot.data);
          // ignore: unnecessary_null_comparison
          if (comments!=null) {
            return CommentList(comment: comments);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Comments> parseJson(dynamic response) {
    // ignore: unnecessary_null_comparison
    final parsed = json.decode(response);
    return parsed.map<Comments>((json) => Comments.fromJson(json)).toList();
  }
}
