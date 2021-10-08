import 'package:android_ios_test/models/repository.dart';
import 'package:flutter/material.dart';

class RepositoryDetail extends StatelessWidget {
  const RepositoryDetail({Key? key, required this.repository})
      : super(key: key);
  final Repository repository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(repository.name.toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    RepoImage(repository: repository),
                    const SizedBox(height: 40),
                    RepoInfo(repository: repository),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class RepoInfo extends StatelessWidget {
  const RepoInfo({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            // flex: 6, // 60% of space => (6/(6 + 4))
            child: Container(
                child: Text(
              'Written in ${repository.programmingLanguage}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Expanded(
            flex: 3, // 40% of space
            child: Column(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${repository.starCount}  stars',
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${repository.watcherCount}  watcher',
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${repository.forkCount} forks',
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${repository.issueCount}   open issues',
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RepoImage extends StatelessWidget {
  const RepoImage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.transparent)),
          child: Image.network(
            repository.owner!.ownerIcon ?? '',
            fit: BoxFit.contain,
            width: 256,
            height: 256,
          ),
        ),
      ],
    );
  }
}
