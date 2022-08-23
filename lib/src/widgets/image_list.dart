// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/image_model.dart';
import 'dart:math';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);
  final index = 0 + Random().nextInt(100 - 0);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.deepPurple,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
              child: Image.network(image.url)),
          Row(
            children: [
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 17,
              ),
              Text(image.toString()),
              Container(
                margin: const EdgeInsets.all(8.0),
              ),
              Text(
                image.link,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
