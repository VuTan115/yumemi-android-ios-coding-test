import 'package:android_ios_test/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key, required this.onTextReadyForSearch}) : super(key: key);
  final Function(String) onTextReadyForSearch;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: (text) {
              onTextReadyForSearch(text);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (controller.text != '') {
                      context
                          .read<AppProvider>()
                          .makeApiCallToBackend(controller.text);
                      onTextReadyForSearch(controller.text);
                    }
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
