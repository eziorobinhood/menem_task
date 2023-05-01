// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menem/views/posts.dart';

class AddPost1 extends StatefulWidget {
  const AddPost1({super.key});

  @override
  State<AddPost1> createState() => _AddPost1State();
}

class _AddPost1State extends State<AddPost1> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Text(
      'Posts appear here',
    ),
    Text(
      'Certificate',
    ),
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text('Create Post'),
      content: SizedBox(
        height: 100,
        width: 300,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                    onPressed: () {
                      Get.to(AddPost1());
                    },
                    icon: Icon(
                      Icons.edit_note,
                      color: Colors.black,
                    ),
                    label: Text(
                      "What would you like to talk",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.black,
                    ),
                    label: Text("Add a photo",
                        style: TextStyle(color: Colors.black))),
              ),
            ],
          ),
        ),
      ),
    ),
    Text(
      'Play Games',
    ),
    Text(
      'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.off(PostsScreen());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Row(
          children: [
            Text(
              "Create Post",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * .4),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    "https://1fid.com/wp-content/uploads/2022/06/cool-profile-picture-2-1024x1024.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Menem ID",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(labelText: "What you think?"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_enhance_outlined), label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_sharp), label: "Gallery"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
