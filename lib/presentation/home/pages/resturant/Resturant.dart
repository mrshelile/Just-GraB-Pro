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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 19,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
            mainAxisSpacing: 16),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 228, 228, 228),
                boxShadow: [BoxShadow(color: Colors.grey)]),
            // height: size.height * 0.1,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/res1.jpg")),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                ),
                Text("Thabos pizaa")
              ],
            ),
          )
        ],
      ),
    );
  }
}
