import 'package:flutter/material.dart';

class Resturant extends StatefulWidget {
  const Resturant({super.key});

  @override
  State<Resturant> createState() => _ResturantState();
}

class _ResturantState extends State<Resturant> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
        right: size.width * 0.03,
      ),
      width: size.width * 1,
      child: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 18,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
            mainAxisSpacing: 16),
        children: [
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=5'),
           Image.network('https://picsum.photos/250?image=6')
        ],
      ),
    );
  }
}
