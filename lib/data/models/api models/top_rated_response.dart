import 'package:movies_application/data/models/api%20models/popular_dto.dart';

class TopRatedResponse {
  int? page;
  List<PopularDto>? results;
  int? totalPages;
  int? totalResults;
  String? message;
  String? code;
  TopRatedResponse(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.code,
      this.message});

  TopRatedResponse.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => PopularDto.fromJson(e)).toList();
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }

    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["genre_ids"] is List) {
      genreIds =
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["video"] is bool) {
      video = json["video"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      data["genre_ids"] = genreIds;
    }
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
