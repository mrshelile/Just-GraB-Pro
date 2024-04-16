import 'package:flutter/material.dart';

class Resturant extends StatefulWidget {
  const Resturant({super.key});

  @override
  State<Resturant> createState() => _ResturantState();
}

class _ResturantState extends State<Resturant> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Restaurant"),
    );
  }
}
