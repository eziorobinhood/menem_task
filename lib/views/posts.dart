// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menem/views/add_post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void navigator(screenname) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screenname));
  }

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
          icon: Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .55),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.messenger_outline,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_to_photos), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
