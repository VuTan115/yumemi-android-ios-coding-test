import 'package:android_ios_test/models/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable(explicitToJson: true)
class Repository {
  final String? name;
  final Owner? owner;
  final String? programmingLanguage;
  final int? forkCount;
  final int? starCount;
  final int? watcherCount;
  final int? issueCount;

  Repository({
    required this.name,
    required this.owner,
    required this.programmingLanguage,
    required this.forkCount,
    required this.issueCount,
    required this.starCount,
    required this.watcherCount,
  });

  Repository.def()
      : name = '',
        owner = Owner.def(),
        programmingLanguage = '',
        forkCount = 0,
        starCount = 0,
        watcherCount = 0,
        issueCount = 0;
  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
