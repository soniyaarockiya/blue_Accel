import 'package:blue_accel/sub_widgets/card_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blue_accel/data/article_pojo.dart';

class AllArticlePage extends StatefulWidget {
  @override
  _AllArticlePageState createState() => _AllArticlePageState();
}

class _AllArticlePageState extends State<AllArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('Articles')
              // .orderBy("timestamp")
              .snapshots(),
          builder: (context, snapshot) {
            // if (!snapshot.hasData) {
            //   return Container(child: Text('Write something........'));
            // }

            List<Article> _articleList = [];

            final articles = snapshot.data.documents;

            for (var article in articles) {
              final title = article.data['title'];
              final description = article.data['description'];
              final articleData = article.data['arcticleData'];
              Article _article = new Article(
                  title: title,
                  description: description,
                  articleData: articleData);

              _articleList.add(_article);
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return CardView(
                  article: _articleList[index],
                );
              },
              itemCount: _articleList.length,
            );
          }),
    );
  }
}
