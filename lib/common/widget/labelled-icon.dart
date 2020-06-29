import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelledIcon extends StatelessWidget {
  final IconData iconData;
  final String data;
  final Color color;

  const LabelledIcon(this.iconData, this.data, {Key key, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = color;
    if (c == null) c = Colors.black54;

    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: c,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            data,
            style: GoogleFonts.barlow(
                    textStyle: Theme.of(context).textTheme.bodyText2)
                .copyWith(fontWeight: FontWeight.w200, color: c),
          ),
        ],
      ),
    );
  }
}
