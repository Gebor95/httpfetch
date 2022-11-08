import 'package:flutter/material.dart';
import 'package:httpfetch/screens/image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Group E Assignment",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            clipBehavior: Clip.none,
            width: double.infinity,
            // height: 10,
            child: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Fetching datas from the internet using Json Placeholder API.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.none,
            width: 300,
            height: 300,
            child: const Image(
                image: NetworkImage(
                    "https://via.placeholder.com/150/92c952.png",
                    scale: 1.0)),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageScreen(),
                  ));
            },
            child: const Text("View All Images"),
          )
        ],
      ),
    );
  }
}
