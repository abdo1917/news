import 'package:flutter/material.dart';
import 'package:newsapp/api/ApiManager.dart';
import 'package:newsapp/home/news/sourcesTab.dart';

import '../api/model/Sourcersreponse.dart';
import '../api/model/newsRespone.dart';
import '../drawer_content.dart';
import '../settings/settings_fragment.dart';
import 'categories/categories_fragment.dart';
import 'news/news-widget.dart';
import 'news/news_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: DrawerContent(onSideMenuItemClick),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )
          ),
          title: Text('news App'),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: NewsSearch());
            }, icon: Icon(Icons.search ,size: 28,) )
          ],
        ),
        body: currentWidget,
      ),
    );
  }

  late Widget currentWidget ;

  void onCategoryItemClick(Category category){
    currentWidget = NewsFragment(category);
    setState(() {});
  }
  void onSideMenuItemClick(int type){
    if(type==DrawerContent.SETTINGS){
      currentWidget = SettingsFragment();
    }else if(type==DrawerContent.CATEGORIES){
      currentWidget=CategoriesFragment(onCategoryItemClick);
    }
    Navigator.pop(context);
    setState(() {});
  }
}



class NewsSearch extends SearchDelegate{
  late  Future<NewsResponse> FutureOfNewsNresponse;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        showResults(context);
      },
          icon: Icon(Icons.search ,size: 28,) )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.clear ,size: 28,) );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FutureBuilder<NewsResponse>(
        future: api_manager.getNews(searchKeyWord: ''),
        builder: (_,snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          else if (snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          var data = snapshot.data;
          if("error" == data?.status){
            return Center(child: Text(data?.message??""),);
          }
          return Expanded(
            child: ListView.builder(itemBuilder:(_,index){
              return NewsWidget((data?.articles![index])!);
            },itemCount: data?.articles?.length ??0, ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return Center(child: Text('Suggestion',style: TextStyle(fontSize: 24),));
  }
  
}
