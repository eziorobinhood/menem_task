// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menem/controllers/authcontroller.dart';
import 'package:menem/controllers/postcontroller.dart';
import 'package:menem/views/posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost1 extends StatefulWidget {
  const AddPost1({super.key});

  @override
  State<AddPost1> createState() => _AddPost1State();
}

class _AddPost1State extends State<AddPost1> {
  String filepath = "";
  late XFile image;
  PostController controller = Get.put(PostController());

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
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .33),
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
            ),
            Container(
              child: filepath == ""
                  ? Image.network(
                      "src",
                      width: 200,
                      height: 300,
                    )
                  : Image.file(
                      File(filepath),
                      width: 200,
                      height: 300,
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {
                image = (await ImagePicker()
                    .pickImage(source: ImageSource.camera)) as XFile;
                if (image != null) {
                  filepath = image.path;
                }
                print(controller.getPosts());
              },
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {
                image = (await ImagePicker()
                    .pickImage(source: ImageSource.gallery)) as XFile;
                if (image != null) {
                  filepath = image.path;
                  print(filepath);
                }
              },
              child: Icon(
                Icons.insert_photo_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
