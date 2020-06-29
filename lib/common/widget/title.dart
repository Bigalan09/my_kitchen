import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHeading extends StatelessWidget {
  final String data;
  final Color color;

  TitleHeading(this.data, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style:
          GoogleFonts.barlow(textStyle: Theme.of(context).textTheme.headline2).copyWith(fontWeight: FontWeight.w600, fontSize: 24.0, color: color),
    );
  }
}
