import 'package:flutter/material.dart';

class Blocklist extends StatefulWidget {
  const Blocklist({super.key});

  @override
  State<Blocklist> createState() => _BlocklistState();
}

class _BlocklistState extends State<Blocklist> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("BlockList"),
    );
  }
}
