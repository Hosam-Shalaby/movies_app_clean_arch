import 'package:movies_application/data/models/api%20models/popular_dto.dart';

class PopularResponse {
  int? page;
  List<PopularDto>? results;
  int? totalPages;
  int? totalResults;

  PopularResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularResponse.fromJson(Map<String, dynamic> json) {
    return PopularResponse(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PopularDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results?.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
