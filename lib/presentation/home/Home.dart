import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:justgrab_pro/application/auth/auth.dart';
import 'package:justgrab_pro/presentation/home/pages/blocklist/Blocklist.dart';
import 'package:justgrab_pro/presentation/home/pages/clients/Client.dart';
import 'package:justgrab_pro/presentation/home/pages/resturant/Resturant.dart';
import 'package:justgrab_pro/presentation/home/widgets/TabItems.dart';
import 'package:justgrab_pro/presentation/sign_in/Sign_in.dart';
import 'package:justgrab_pro/theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int visit = 0;
  final List<Widget> screens = const [Restaurant(), Client(), Blocklist()];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;

    return Scaffold(
      backgroundColor: white2,
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            BottomBarInspiredOutside(
              items: tabItems,
              backgroundColor: brown1,
              color: gold1,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
              top: -25,
              animated: true,
              itemStyle: ItemStyle.hexagon,
              chipStyle: const ChipStyle(
                  drawHexagon: true, background: Colors.redAccent),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(top: size.height * 1),
              height: size.height,
              color: white2),
          Container(
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
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
                  width: size.width * 0.02,
                ),
                Container(
                  width: size.width * 0.4,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    "WELCOME BACK ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: brown1),
                  ),
                ),
                SizedBox(
                    width: size.width * 0.2,
                    child: IconButton(
                        onPressed: () async {
                          await Auth().auth.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ));
                        },
                        icon: const Icon(Icons.logout))),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            child: Container(
                height: size.height * 0.686,
                // color: gold1,
                child: screens[visit]),
          )
        ],
      ),
    );
  }
}
