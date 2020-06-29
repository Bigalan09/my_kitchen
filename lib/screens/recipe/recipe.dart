import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_kitchen/common/mvi/viewstate.dart';
import 'package:my_kitchen/common/widget/labelled-icon.dart';
import 'package:my_kitchen/common/widget/subheading.dart';
import 'package:my_kitchen/common/widget/detail-scaffold.dart';
import 'package:my_kitchen/common/widget/heading.dart';
import 'package:my_kitchen/common/widget/scrollable_tags.dart';
import 'package:my_kitchen/common/widget/tag.dart';
import 'package:my_kitchen/localization/localization.dart';
import 'package:my_kitchen/screens/recipe/intent.dart';
import 'package:my_kitchen/screens/recipe/model.dart';
import 'package:my_kitchen/screens/recipe/state.dart';

class RecipePage extends StatefulWidget {
  static String tag = 'recipe';

  final RecipeIntent intent = RecipeIntent();
  final RecipeViewModel model = RecipeViewModel();

  @override
  _RecipePageState createState() =>
      _RecipePageState(intent: intent, model: model);
}

class _RecipePageState
    extends ViewState<RecipePage, RecipeViewModel, RecipeIntent, RecipeState> {
  _RecipePageState(
      {@required RecipeIntent intent, @required RecipeViewModel model})
      : super(intent, model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<RecipeState> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          return _buildContentWidget(context);
        });
  }

  Widget _buildContentWidget(BuildContext context) {
    var expandedHeight = MediaQuery.of(context).size.height / 2.25;
    return Scaffold(
      body: DetailScaffold(
        expandedHeight: expandedHeight,
        hasPinnedAppBar: true,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            stretch: true,
            elevation: 0.0,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              tooltip: 'Add new entry',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                ),
                tooltip: 'Add new entry',
                onPressed: () {/* ... */},
              ),
            ],
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            expandedHeight: expandedHeight,
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
                    'assets/images/pizza.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -0.4),
                        end: Alignment(0.0, 0.7),
                        colors: <Color>[
                          Color(0x99000409),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 7, 43, 22),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Heading(Localization.of(context).recipeTitle),
              ]),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 32),
            sliver: SliverToBoxAdapter(
              child: ScrollableTags(
                tags: <Tag>[
                  Tag('Takeaway'),
                  Tag('Pizza'),
                  Tag('Cheese'),
                  Tag('Tomato'),
                  Tag('Basil')
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
                child: Row(
              children: <Widget>[
                RatingBar(
                  initialRating: 4.4,
                  minRating: 1,
                  maxRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 21.0,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
              child: Divider(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
              child: SubHeading(
                Localization.of(context).insiderInfo,
                capitalise: true,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
              child: ExpandText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Molestie nunc non blandit massa enim nec dui nunc mattis. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Odio morbi quis commodo odio aenean sed adipiscing. Tellus mauris a diam maecenas. Vitae turpis massa sed elementum tempus egestas sed sed. Eleifend mi in nulla posuere sollicitudin aliquam ultrices. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui. Turpis egestas maecenas pharetra convallis posuere morbi leo. Eget egestas purus viverra accumsan in nisl. A erat nam at lectus. Nec dui nunc mattis enim ut tellus elementum sagittis vitae. Mauris a diam maecenas sed enim.\n\nViverra aliquet eget sit amet. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Pulvinar etiam non quam lacus suspendisse. Phasellus vestibulum lorem sed risus. Magna fermentum iaculis eu non diam phasellus vestibulum lorem. Tempus egestas sed sed risus pretium. Cras tincidunt lobortis feugiat vivamus. Id eu nisl nunc mi ipsum. Viverra adipiscing at in tellus integer feugiat scelerisque varius. Risus feugiat in ante metus. Aliquam sem fringilla ut morbi tincidunt augue interdum. Sed risus ultricies tristique nulla aliquet enim tortor. Nulla at volutpat diam ut venenatis. Nisl rhoncus mattis rhoncus urna neque viverra. Elit pellentesque habitant morbi tristique senectus et netus et. Sed odio morbi quis commodo odio aenean sed adipiscing diam. Nunc eget lorem dolor sed viverra ipsum nunc. Massa vitae tortor condimentum lacinia quis.\n\nAt risus viverra adipiscing at in tellus integer feugiat. Platea dictumst quisque sagittis purus. Quam nulla porttitor massa id neque aliquam vestibulum morbi. Molestie a iaculis at erat pellentesque adipiscing. Ut diam quam nulla porttitor. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Egestas quis ipsum suspendisse ultrices. Posuere urna nec tincidunt praesent. Vel turpis nunc eget lorem dolor sed viverra ipsum. Morbi non arcu risus quis varius quam quisque id. Pharetra et ultrices neque ornare. Purus non enim praesent elementum. Proin sed libero enim sed faucibus turpis in.\n\nMi bibendum neque egestas congue. Diam ut venenatis tellus in metus vulputate eu scelerisque. Velit euismod in pellentesque massa placerat duis. Congue nisi vitae suscipit tellus. Et tortor consequat id porta nibh venenatis. Dignissim diam quis enim lobortis scelerisque. Egestas pretium aenean pharetra magna ac placerat. Cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Hendrerit gravida rutrum quisque non tellus orci ac. Lectus mauris ultrices eros in cursus turpis massa tincidunt dui. Odio facilisis mauris sit amet. Nibh tortor id aliquet lectus proin nibh. Vivamus arcu felis bibendum ut. Sit amet risus nullam eget felis. Aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus. Luctus venenatis lectus magna fringilla. Eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis.\n\nEnim praesent elementum facilisis leo vel fringilla est ullamcorper. Arcu felis bibendum ut tristique et egestas. Nunc mattis enim ut tellus elementum sagittis vitae. Vulputate dignissim suspendisse in est ante. Posuere urna nec tincidunt praesent semper. Amet purus gravida quis blandit. Suspendisse ultrices gravida dictum fusce ut. Mi in nulla posuere sollicitudin aliquam ultrices sagittis. Eget aliquet nibh praesent tristique. Lorem donec massa sapien faucibus et molestie ac feugiat. Mi sit amet mauris commodo. Quam vulputate dignissim suspendisse in est ante in.',
                maxLines: 4,
                expandOnGesture: false,
                style: GoogleFonts.barlow(
                  textStyle: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 12.0,
                      letterSpacing: 0.75,
                      height: 1.8,
                      color: Colors.black38),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
              child: Divider(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(43, 0, 43, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LabelledIcon(
                    Icons.access_alarm,
                    '25 min',
                    color: Colors.black45,
                  ),
                  LabelledIcon(
                    Icons.access_alarm,
                    '25 min',
                    color: Colors.black45,
                  ),
                  LabelledIcon(
                    Icons.access_alarm,
                    '25 min',
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
          ),
        ],
      ),
    );
  }
}
