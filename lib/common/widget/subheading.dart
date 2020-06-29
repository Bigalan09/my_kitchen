import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeading extends StatelessWidget {
  final String data;
  final bool capitalise;

  SubHeading(this.data, {this.capitalise = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.capitalise ? this.data.toUpperCase() : this.data,
      style: GoogleFonts.barlow(
          textStyle: Theme.of(context).textTheme.headline6.copyWith(fontSize: 10.0, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
    );
  }
}
