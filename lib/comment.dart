class Comments{
String comment='';
int wins=0;
int losses=0;
List <Comments> child=[];

Comments({
 required this.child,required this.comment,required this.losses,required this.wins
});
factory Comments.fromJson(Map<String,dynamic>json)
{
  return Comments(
    comment: json['comment'] as String,
    losses:  json['losses'] as int,
    wins:   json['wins'] as int,
    child: json["child"] != null
        ? List<Comments>.from(json['child'].map((x) => Comments.fromJson(x)))
        : <Comments>[],
  );
}

}

/*

class ChildComments{
  String childComment;
  int childWins;
  int childLosses;
  List<SubChildComments>childChild;

  ChildComments({required this.childChild,required this.childComment,required this.childLosses,required this.childWins
});

  factory ChildComments.fromJson(Map<String,dynamic>json)
  {
    return ChildComments(
        childComment: json['child[comment]'] as String,
        childLosses:  json['child[losses]'] as int,
        childWins:   json['child[wins]'] as int,
      childChild: json['child[child]'] != null
          ? List<SubChildComments>.from(json['child[child]'].map((x) => SubChildComments.fromJson(x)))
          : <SubChildComments>[],
    );
  }

}

class SubChildComments{
  String subChildComment;
  int subChildWins;
  int subChildLosses;
  SubChildComments({required this.subChildComment,required this.subChildLosses ,required this.subChildWins

});

  factory SubChildComments.fromJson(Map<String,dynamic>json)
  {
   return SubChildComments(
     subChildComment: json['child[child[comment]]'] as String,
     subChildLosses:  json['chid[child[losses]'] as int,
     subChildWins:   json['child[child[wins]]'] as int
   );
  }

}

*/
