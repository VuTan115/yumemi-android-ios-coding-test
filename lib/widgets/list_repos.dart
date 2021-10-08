import 'package:android_ios_test/models/repository.dart';
import 'package:android_ios_test/pages/repo_detail.dart';
import 'package:android_ios_test/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListRepositories extends StatelessWidget {
  final bool loading = false;
  const ListRepositories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Repository> repoItem = context.watch<AppProvider>().repoItems;
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: (repoItem.isEmpty
          ? const NotFoundRepo()
          : RepoView(repoItem: repoItem)),
    ));
  }
}

class RepoView extends StatelessWidget {
  const RepoView({
    Key? key,
    required this.repoItem,
  }) : super(key: key);

  final List<Repository> repoItem;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<AppProvider>().futureQueryResult,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListRepo(repoItem: repoItem);
        } else {
          return const MyLoading();
        }
      },
    );
  }
}

class NotFoundRepo extends StatelessWidget {
  const NotFoundRepo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No data',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class ListRepo extends StatelessWidget {
  const ListRepo({
    Key? key,
    required this.repoItem,
  }) : super(key: key);

  final List<Repository> repoItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListView.builder(
        itemCount: repoItem.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RepositoryDetail(
                        repository: repoItem[index],
                      )),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(3.0, 0.0),
                    blurRadius: 2.0,
                    // spreadRadius: 1.0,
                  ), //BoxShadow
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade100,
                )),
            child: ListTile(
              isThreeLine: true,
              subtitle: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      repoItem[index].programmingLanguage ?? '',
                    ),
                  ],
                ),
              ),
              title: Text(repoItem[index].name ?? ''),
              leading: Image.network(
                repoItem[index].owner!.ownerIcon ?? '',
                width: 64,
                height: 64,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyLoading extends StatelessWidget {
  const MyLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        semanticsLabel: 'Loading data...',
      ),
    );
  }
}
