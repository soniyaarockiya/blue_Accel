import 'package:flutter/material.dart';
import 'package:blue_accel/data/article_pojo.dart';
import 'package:blue_accel/constants/ui_constants.dart';

class CardView extends StatefulWidget {
  CardView({this.article});
  final Article article;

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.article.title.toString(),
                style: KTextField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.article.description.toString(),
                style: KTextField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.article.articleData.toString(),
                style: KTextField,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
