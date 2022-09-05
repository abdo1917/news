import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/model/Sourcersreponse.dart';

import 'model/newsRespone.dart';


class api_manager {
  static const String BASE_URL ='newsapi.org';
  static const String API_KEY ='7861220fedd4485cb3288fdd8c4abc50';


  static Future<SourcesResponse> getNewsSource(String categoryId) async{
    // ?apikey=pub_1070084f51fdb0e51b5c2d43cc9dc64c8236d&q=cryptocurrency
    var uri = Uri.https(BASE_URL, 'v2/top-headlines/sources',
        { 'apiKey':API_KEY,'category':categoryId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    SourcesResponse sourcersreponse= SourcesResponse.fromJson(json);
    if(response.statusCode==200 || response.statusCode==401){
       return sourcersreponse;
    }
    throw Exception((sourcersreponse.message)??'Something went wrong.'
        ' couldnt connect to server');

  }

  static Future<NewsResponse> getNews(
      {String? sourceId,
        String? searchKeyWord,
        int? page
      }) async{
    var uri = Uri.https(BASE_URL, 'v2/everything',
        {'apiKey':API_KEY,
          'sources':sourceId,
        'q':searchKeyWord,
          'pageSize': '20',
          'page' : '$page',
        }
    );
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }


}