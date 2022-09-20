import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();

    return MaterialApp(
      // title: 'Welcome to Flutter',
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('Welcome to Flutter'),
          title: const Text('Startup Name Generator'),
        ),
        // body: Center(
        //   child: Text(wordPair.asPascalCase),
        // ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        print(i);

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
  //...
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}
