import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';
import '../config/key.dart';

//create a class to be a custom widget
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
// must define a ''build'' method that returns *this* widget
  int counter = 0;
  List<ImageModel> images = [];

  //fetching an image
  void fetchImage() async {
    final response = await get(
        Uri.parse('https://api.unsplash.com/photos?client_id=$clientID'));

    final imageModel = ImageModel.fromJson(jsonDecode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Let\'s see some Images',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
