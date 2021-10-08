import 'package:android_ios_test/models/repository.dart';
import 'package:android_ios_test/repositories/application_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class AppProvider with ChangeNotifier {
  // declare variable
  final Logger _logger = Logger('Provider');

  List<Repository> _repoItems = [];
  Future<List<Repository>> _futureQueryResult =
      Future(() => List.filled(0, Repository.def()));

  //getter for each variable
  Future<List<Repository>> get futureQueryResult => _futureQueryResult;

  List<Repository> get repoItems => _repoItems;

  //data provider
  void makeApiCallToBackend(String input) async {
    try {
      _futureQueryResult =
          searchRepos(query: input, sort: "stars", order: "desc");
      List<Repository> dummyRepo = await _futureQueryResult;
      _repoItems = dummyRepo;
    } catch (e) {
      _logger.warning(e.toString());
    }
    notifyListeners();
  }
}
