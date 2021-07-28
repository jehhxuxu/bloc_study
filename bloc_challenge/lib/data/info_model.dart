import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String title;
  final int author;

  InfoModel({
    required this.title,
    required this.author,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      title: json['title']['rendered'],
      author: json['author'],
    );
  }

  @override
  List<Object?> get props => [];
}
