import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies_application/data/models/api%20models/genre_list.dart';
import 'package:movies_application/data/models/api%20models/popular_response.dart';
import 'package:movies_application/utls/constant/api_constant.dart';

@singleton
@injectable
class ApiManager {
  //  popular
  Future<PopularResponse> getPopularMovies() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.popularEndPoint,
        {"api_key": ApiConstant.apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(json);
    return popularResponse;
  }

  // newReleases
  Future<PopularResponse> getNewReleases() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.newRealeasesEndPoint,
        {"api_key": ApiConstant.apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    PopularResponse newReleases = PopularResponse.fromJson(json);
    return newReleases;
  }

  // top rated
  Future<PopularResponse> getTopRated() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.recommendedEndPoint,
        {"api_key": ApiConstant.apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    PopularResponse topRated = PopularResponse.fromJson(json);
    return topRated;
  }

  //  moviesDetails
  // Future<PopularResponse> getMovieDetails(int movieId) async {
  //   var url = Uri.https('api.themoviedb.org', '/3/movie/$movieId/similar', {
  //     "api_key": ApiConstant.apiKey,
  //   });
  //   var response = await http.get(url);
  //   var json = jsonDecode(response.body);
  //   PopularResponse moviesDetails = PopularResponse.fromJson(json);
  //   return moviesDetails;
  // }
  Future<PopularResponse> getMovieDetails(int movieId) async {
    var url = Uri.https(ApiConstant.baseUrl, '/3/movie/$movieId',
        {"api_key": ApiConstant.apiKey});
    var response = await http.get(url);

    // تحقق من حالة الاستجابة
    print("Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("Data received: $json"); // طباعة البيانات المستلمة
      return PopularResponse.fromJson(json);
    } else {
      print("Error: Failed to load movie details");
      throw Exception('Failed to load movie details');
    }
  }

  // search
  Future<PopularResponse> getSearchMovies(query) async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.searchEndPoint,
        {"api_key": ApiConstant.apiKey, "query": query});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    PopularResponse searchMovies = PopularResponse.fromJson(json);
    return searchMovies;
  }

  // categories
  Future<GenresList> getCategories() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.moviesListEndPoint,
        {"api_key": ApiConstant.apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    GenresList categories = GenresList.fromJson(json);
    return categories;
  }
}
