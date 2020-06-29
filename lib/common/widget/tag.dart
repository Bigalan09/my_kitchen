import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tag extends StatelessWidget {
  final String data;

  Tag(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0x197EA092),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Text(
          data,
          style: GoogleFonts.barlow(
            textStyle: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Color(0xff7EA092), fontSize: 11.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
