import 'package:flutter/material.dart';
import 'package:json_demo_3/comment.dart';

class CommentList extends StatelessWidget {
  CommentList({Key? key, required this.comment}) : super(key: key);
  List<Comments> comment = [];
  TextStyle textStyle = const TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: comment == null ? 0 : 1,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: body(comment, x)),
              ),
            );
          }),
    );
  }
}

double x = 0;

Padding body(List<Comments> comment, double leftPadding) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (int index = 0; index < comment.length; index++) ...[
            Text("Comment:" + comment[index].comment),
            Text("Wins:" + comment[index].wins.toString()),
            Text("Losses:" + comment[index].losses.toString()),
            if (comment[index].child.isNotEmpty)
              body(comment[index].child, leftPadding + 30)
          ]
        ]),
  );
}
