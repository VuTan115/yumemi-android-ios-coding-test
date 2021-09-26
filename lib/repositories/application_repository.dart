import 'dart:convert';

import 'package:android_ios_test/models/repository.dart';
import 'package:android_ios_test/utils/constants.dart';

import 'package:http/http.dart' as http;

Future<List<Repository>> searchRepos(
    {required String query, String? sort, String? order}) async {
  final queryParameters = {
    'q': "=" + query,
    'sort': sort,
    'order': order,
  };
  final uri =
      Uri.https(GITHUB_API_URL, GITHUB_API_GET_SEARCH_REPO, queryParameters);
  print(uri);
  final response = await http.get(uri);
  List<Repository> repositories = [];
  if (response.statusCode != 200) {
    return [];
  }
  final jsonRepo = json.decode(response.body);
  for (var i = 0; i < jsonRepo['items'].length; i++) {
    Map<String, dynamic> dummyOwner = {
      'ownerName': jsonRepo['items'][i]['owner']['login'],
      'ownerIcon': jsonRepo['items'][i]['owner']['avatar_url']
    };

    final Map<String, dynamic> repoJson = {
      'name': jsonRepo['items'][i]['full_name'],
      'owner': dummyOwner,
      'programmingLanguage': jsonRepo['items'][i]['language'],
      'forkCount': jsonRepo['items'][i]['forks'],
      'issueCount': jsonRepo['items'][i]['open_issues_count'],
      'starCount': jsonRepo['items'][i]['stargazers_count'],
      'watcherCount': jsonRepo['items'][i]['watchers_count']
    };
    repositories.add(Repository.fromJson(repoJson));
  }

  return repositories;
}
