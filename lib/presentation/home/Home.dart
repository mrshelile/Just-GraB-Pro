import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justgrab_pro/theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;

    return Scaffold(
      backgroundColor: white2,
      bottomNavigationBar: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            BottomBarInspiredOutside(
              items: items,
              backgroundColor: brown1,
              color: gold1,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
              // top: -25,
              animated: true,
              itemStyle: ItemStyle.hexagon,
              chipStyle: const ChipStyle(
                  drawHexagon: true, background: Colors.redAccent),
            ),
            // SizedBox(height: 25),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(top: size.height * 1),
                height: size.height,
                color: white2),
            Container(
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  CircleAvatar(
                    radius: size.width * 0.12,
                    child: Image.asset(
                      "assets/log2.png",
                      // height: size.height * 0.,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  Container(
                    width: size.width * 0.59,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      "WELCOME BACK Malefetsane Shelile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: brown1),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<TabItem> items = [
  TabItem(
    icon: Icons.restaurant,
    title: 'Restaurants',
  ),
  TabItem(
    icon: Icons.people,
    title: 'Clients',
  ),
  TabItem(
    icon: Icons.block,
    title: 'BlockList',
  ),
];
