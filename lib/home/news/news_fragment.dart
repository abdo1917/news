import 'package:flutter/material.dart';
import 'package:newsapp/api/ApiManager.dart';
import '../../api/model/Sourcersreponse.dart';
import '../categories/categories_fragment.dart';
import 'sourcesTab.dart';

class NewsFragment extends StatelessWidget{
  Category category;
  NewsFragment(this.category);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SourcesResponse>
          (future:api_manager.getNewsSource(category.id) ,
            builder:(buildContext,snapshot){
            if(snapshot.hasError){
              return Center(child: Text(
                snapshot.error.toString()),
              );
            }else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            // has data
              var response = snapshot.data;
            if(response?.status =='error'){
              return Center(child: Text(
                  response?.message ?? ""),
              );
            }
            return Expanded(child: SourcesTabs((response?.sources)!));
            } )
      ],
    );
  }
}
