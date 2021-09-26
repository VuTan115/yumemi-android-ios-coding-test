import 'package:android_ios_test/providers/provider.dart';
import 'package:android_ios_test/widgets/list_repos.dart';
import 'package:android_ios_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github repo search'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            SearchBar(onTextReadyForSearch: (String val) {
              AppProvider().makeApiCallToBackend(val);
              // AppProvider().setLoading();
            }),
            Consumer<AppProvider>(builder: (context, value, child) {
              return const Expanded(child: ListRepositories());
            })
          ])),
    );
  }
}
