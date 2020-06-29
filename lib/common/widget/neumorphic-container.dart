import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;

  const NeumorphicContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        elevation: 1000,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
