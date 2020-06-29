import 'package:flutter/material.dart';

class PersistentBottomSheet extends StatelessWidget {
  final Widget child;
  final bool hasHandle;

  PersistentBottomSheet({
    Key key,
    @required this.child,
    this.hasHandle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.45,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: CustomScrollViewContent(child: child, hasHandle: hasHandle),
        );
      },
    );
  }
}

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  final Widget child;
  final bool hasHandle;

  CustomScrollViewContent({this.child, this.hasHandle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: CustomInnerContent(
          child: child,
          hasHandle: hasHandle,
        ),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  final Widget child;
  final bool hasHandle;

  CustomInnerContent({@required this.child, this.hasHandle});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [SizedBox(height: 15)];

    if (hasHandle) {
      items.add(CustomDraggingHandle());
      items.add(SizedBox(height: 15));
    }

    items.add(child);

    return Column(
      children: items,
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}
