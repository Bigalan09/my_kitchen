import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  final String data;

  Heading(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style:
          GoogleFonts.barlow(textStyle: Theme.of(context).textTheme.headline6).copyWith(fontWeight: FontWeight.bold),
    );
  }
}
