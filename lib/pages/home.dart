import "package:flutter/material.dart";
import "package:portfolio_app/components/chevron_button.dart";
import "package:portfolio_app/components/drawer.dart";
import "package:portfolio_app/util/util.dart";

import "../util/routes.dart";
import "about_me.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* appbar
      appBar: AppBar(
        leading: Builder(
          builder: (context) =>
            MaterialButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },

              shape: const CircleBorder(),
                child: const Icon(
                  Icons.menu,
                  size: 28,
                )
            ),
        ),

        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),

      drawer: const CustomDrawer(pageIndex: 1),

      //* body
      body: Padding(
        padding: const EdgeInsets.only(left: paddingM, right: paddingM, top: 220),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // image and the circle
            Stack(
              clipBehavior: Clip.none,
              children: [
                // ellipse
                Positioned(
                  right: -180 - paddingM,
                  top: -120,
                  child: Container(
                    height: 360,
                    width: 360,
                    //* container decoration
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),

                // image
                Positioned(
                  left: 115 - paddingM,
                  top: -150,
                  child: Transform(
                    transform: Matrix4.rotationZ(-0.47577675),
                    child: const Image(
                      image: AssetImage('lib/images/me.png'),
                      width: 357,

                    ),
                  ),
                )
              ],
            ),

            // name and details
           const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wendel Sabelo",
                    style: TextStyle(fontSize: 42, letterSpacing: -3, fontWeight: FontWeight.bold, color: highlightColor),
                  ),

                  Text(
                    "Mobile/Web Developer",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    "Carmen, Philippines",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ]
            ),

            // circle outline design
            Positioned(
              bottom: -133.5,
              left: -133.5 - paddingM,
              child: Container(
                height: 267,
                width: 267,
                //* container decoration
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 6),
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),

            //   chevron down
            Positioned(
              bottom: 37,
              right: 0,
                child: ChevronButton(
                    onPress: () {
                      Navigator.of(context).pushReplacement(routeTo(2, const Offset(0, 1.0)));
                    },
                    direction: "down"
                ),
            )
          ],
        ),
      )
    );
  }
}


