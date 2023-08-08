import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Modulabs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _sourceLanguage = TranslateLanguage.english;
  final _targetLanguage = TranslateLanguage.korean;
  late final _onDeviceTranslator = OnDeviceTranslator(
    sourceLanguage: _sourceLanguage, targetLanguage: _targetLanguage);
  final _translationController = StreamController<String>();

  @override
  void dispose() {
    _translationController.close();
    _onDeviceTranslator.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title, 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 45.0,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '번역할 내용을 입력하세요',
                border: InputBorder.none,
                ),
              onSubmitted: (text) async {
                final translation = await _onDeviceTranslator.translateText(text);
                _translationController.add(translation);
              },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            padding: const EdgeInsets.only(left: 30),
            child: StreamBuilder<String>(
              stream: _translationController.stream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: const TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold
                  ),
                );
              })
          ),
        ]
      )
    );
  }
}