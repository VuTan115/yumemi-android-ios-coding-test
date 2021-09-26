import 'package:android_ios_test/models/repository.dart';
import 'package:android_ios_test/repositories/application_repository.dart';
import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier {
  // declare variable
  List<Repository> _repoItems = [];
  bool _isReady = false;
  Future<List<Repository>> _futureQueryResult =
      Future(() => List.filled(0, Repository.def()));

  //getter for each variable
  Future<List<Repository>> get futureQueryResult => _futureQueryResult;

  List<Repository> get repoItems => _repoItems;

  bool get isReady => _isReady;

  //data provider
  void makeApiCallToBackend(String input) async {
    _futureQueryResult =
        (searchRepos(query: input, sort: "stars", order: "desc"));
    List<Repository> dummyRepo = await _futureQueryResult;
    _repoItems = dummyRepo;
    notifyListeners();
  }
}
