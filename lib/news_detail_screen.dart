import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'api/model/newsRespone.dart';
import 'date_utils.dart';

class news_details_screen extends StatelessWidget {
  static const String routeName = 'news_detail_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child:SingleChildScrollView(
        child: Column(
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
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
              ),
              textAlign: TextAlign.start,),
            Text(MyDateUtils.formatNewsDate(news.publishedAt!),
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFA3A3A3)
              ),
              textAlign: TextAlign.end,),
            SizedBox(height: size.height * .05,),
            Text(news.content?? '', style: TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height * .1,),

            TextButton(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(AppLocalizations.of(context)!.allarticle,style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w500,
              color: Colors.black),
              ),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
            ],
            ),
              onPressed: (){
              open_url(news.url);
              },)
          ],
        ),
      ),
    );
  }
  void open_url (String? url) async{

    if(url==null){
      return;
    }
    var uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  }
}
