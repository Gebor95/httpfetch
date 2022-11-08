import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpfetch/model/user_model.dart';
import 'package:http/http.dart' as http;

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  Future getImages() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    //print(response.body);
    var imageResponseData = jsonDecode(response.body);

    List<MyData> imageList = [];
    if (response.statusCode == 200) {
      for (var imageIndexnum in imageResponseData) {
        MyData imageListData = MyData(
            imageIndexnum['albumId'],
            imageIndexnum['id'],
            imageIndexnum['title'],
            imageIndexnum['url'],
            imageIndexnum['thumbnailUrl']);

        imageList.add(imageListData);
      }
    } else {
      throw Exception("Error connecting to server");
    }

    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Images From Internet",
        ),
        centerTitle: true,
      ),
      body: Card(
        child: FutureBuilder(
          future: getImages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  var imageholder = snapshot.data[index].myThumbnailUrl;
                  return Container(
                    clipBehavior: Clip.none,
                    child: Image(image: NetworkImage("$imageholder.jpg")),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Could not fetch data ...",
                        style: TextStyle(fontSize: 25.0, color: Colors.blue)),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading data ...",
                        style: TextStyle(fontSize: 25.0, color: Colors.blue)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
