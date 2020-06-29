import 'package:flutter/material.dart';
import 'package:my_kitchen/common/widget/tag.dart';

class ScrollableTags extends StatelessWidget {
  final List<Tag> tags;

  const ScrollableTags({Key key, @required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: tags),
    );
  }
}
