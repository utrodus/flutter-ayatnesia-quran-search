import 'verse_model.dart';

class SearchVerseResultModel {
  num? executionTime;
  List<VerseModel>? results;

  SearchVerseResultModel({this.executionTime, this.results});

  @override
  String toString() {
    return 'SearchVerseResultModel(executionTime: $executionTime, results: $results)';
  }

  factory SearchVerseResultModel.fromJson(Map<String, dynamic> json) {
    return SearchVerseResultModel(
      executionTime: num.tryParse(json['execution_time'].toString()),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VerseModel.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}
