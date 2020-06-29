import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen/common/mvi/viewstate.dart';
import 'package:my_kitchen/common/widget/heading.dart';
import 'package:my_kitchen/common/widget/neumorphic-container.dart';
import 'package:my_kitchen/common/widget/recipe-tile.dart';
import 'package:my_kitchen/common/widget/title.dart';
import 'package:my_kitchen/localization/localization.dart';
import 'package:my_kitchen/screens/dashboard/intent.dart';
import 'package:my_kitchen/screens/dashboard/model.dart';
import 'package:my_kitchen/screens/dashboard/state.dart';
import 'package:my_kitchen/screens/recipe/recipe.dart';

class DashboardPage extends StatefulWidget {
  static String tag = 'dashboard';

  final DashboardIntent intent = DashboardIntent();
  final DashboardViewModel model = DashboardViewModel();

  @override
  _DashboardPageState createState() =>
      _DashboardPageState(intent: intent, model: model);
}

class _DashboardPageState extends ViewState<DashboardPage, DashboardViewModel,
    DashboardIntent, DashboardState> {
  _DashboardPageState(
      {@required DashboardIntent intent, @required DashboardViewModel model})
      : super(intent, model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder:
            (BuildContext context, AsyncSnapshot<DashboardState> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          return _buildContentWidget(context);
        });
  }

  Widget _buildContentWidget(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.favorite,),
        onPressed: () {},
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            stretch: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/background.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.4),
                        end: Alignment(0.0, -0.7),
                        colors: <Color>[
                          Color(0x77000409),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 43.0),
                          child: TitleHeading(
                            Localization.of(context).dashboardWelcomeText,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 43.0),
                          child: CupertinoTextField(
                            keyboardType: TextInputType.text,
                            placeholder:
                                Localization.of(context).searchPlaceholder,
                            placeholderStyle: TextStyle(
                              color: Color(0xffC4C6CC),
                              fontSize: 14.0,
                            ),
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                              child: Icon(
                                Icons.search,
                                color: Color(0xffC4C6CC),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xffF0F1F5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(43.0, 20.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Heading(Localization.of(context).recommendedRecipes),
                  Container(
                    height: 400.0,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return new GestureDetector(
                          child: RecipeTile(),
                          onTap: () {
                            Navigator.of(context).pushNamed(RecipePage.tag);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
              ],
            ),
          ),
          SliverFillRemaining(
            child: NeumorphicContainer(child: Text('Space')),
            hasScrollBody: false,
            fillOverscroll: false,
          )
        ],
      ),
    );
  }

  BottomAppBar _buildBottomNavigation() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Color(0xFFDADADA),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.receipt,
              color: Color(0xFFDADADA),
            ),
            onPressed: () {},
          ),
          SizedBox(),
          IconButton(
            icon: Icon(
              Icons.restaurant_menu,
              color: Color(0xFFDADADA),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xFFDADADA),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
