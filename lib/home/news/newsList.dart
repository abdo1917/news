import 'package:flutter/material.dart';
import 'package:newsapp/api/ApiManager.dart';

import '../../api/model/Sourcersreponse.dart';
import '../../api/model/newsRespone.dart';
import 'news-widget.dart';

class NewsList extends StatefulWidget {

  Source source;
  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int pageNumber =0 ;
  final ScrollController scroll_controller = ScrollController();
  bool atButtom = false;
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    scroll_controller.addListener(() {

      if(scroll_controller.position.atEdge)
      {
        if(scroll_controller.position.pixels == 0){
          bool isTop =scroll_controller.position.pixels==0;
          if(!isTop){
            atButtom= true;
            setState(){};
          }
        }
      };
    });
  }

  @override
  void dispose() {
    scroll_controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future:
          !atButtom ?
      api_manager.getNews(sourceId: widget.source.id ??'' ,)
              : api_manager.getNews(sourceId: widget.source.id ??'' , page: ++pageNumber),
      builder: (_,snapshot){
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }
        else if (snapshot.hasData){
          if(news.isNotEmpty && news[0] == snapshot.data?.articles![0]){
            news=[];
            scroll_controller.jumpTo(0);
            print('object');
          }
          Expanded(
            child: ListView.builder(itemBuilder:(_,index){
              return NewsWidget((news[index])!);
            },itemCount: news.length ??0, controller: scroll_controller, ),
          );
        }
        else if (snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        var data = snapshot.data;
        if("error" == data?.status){
          return Center(child: Text(data?.message??""),);
        }
        news.addAll(data?.articles ??[]);
        return Expanded(
          child: ListView.builder(itemBuilder:(_,index){
            return NewsWidget((news[index])!);
          },itemCount: news.length ??0, controller: scroll_controller, ),
        );
      },
    );
  }
}
