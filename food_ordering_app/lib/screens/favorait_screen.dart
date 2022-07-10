import 'package:flutter/material.dart';

class FavouraitScreen extends StatefulWidget {
  const FavouraitScreen({Key? key}) : super(key: key);

  @override
  State<FavouraitScreen> createState() => _FavouraitScreenState();
}

class _FavouraitScreenState extends State<FavouraitScreen> {
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text("Adjust Your meal Selections",
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
