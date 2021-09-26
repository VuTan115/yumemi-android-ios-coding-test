// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      name: json['name'] as String?,
      owner: json['owner'],
      programmingLanguage: json['programmingLanguage'] as String?,
      forkCount: json['forkCount'] as int?,
      issueCount: json['issueCount'] as int?,
      starCount: json['starCount'] as int?,
      watcherCount: json['watcherCount'] as int?,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'programmingLanguage': instance.programmingLanguage,
      'forkCount': instance.forkCount,
      'starCount': instance.starCount,
      'watcherCount': instance.watcherCount,
      'issueCount': instance.issueCount,
    };
