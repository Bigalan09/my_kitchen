import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.fromLTRB(0, 25, 10.0, 25),
      child: InkWell(
        child: Container(
          width: 275,
          height: 400,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 210,
                left: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tags',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(219, 219, 219, 1),
                            fontFamily: 'Roboto',
                            fontSize: 11,
                            letterSpacing:
                                0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      SizedBox(height: 25),
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
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 275,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/pizza.jpg'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
