import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api/model/newsRespone.dart';
import '../../date_utils.dart';

class NewsWidget extends StatelessWidget {

  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage??'',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.author??"",
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFFA3A3A3)
            ),
            textAlign: TextAlign.start,),
          Text(news.title??"",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.start,),
          Text(MyDateUtils.formatNewsDate(news.publishedAt!),
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFFA3A3A3)
            ),
            textAlign: TextAlign.end,),

        ],
      ),
    );
  }
}
