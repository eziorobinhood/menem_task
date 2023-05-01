// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iron,
    required this.screenname,
  }) : super(key: key);
  final String iron;
  final VoidCallback screenname;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          screenname;
        },
        icon: Icon(Icons.iron));
  }
}
