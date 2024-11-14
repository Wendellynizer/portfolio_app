import "package:flutter/material.dart";

import "package:portfolio_app/components/custom_button.dart";
import "package:portfolio_app/util/util.dart";
import "package:portfolio_app/util/routes.dart";
import "../components/chevron_button.dart";
import "../components/drawer.dart";

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(routeTo(1, const Offset(0, -1.0)));
            },
            icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 40,)
          ),
        ],

        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),

      drawer: const CustomDrawer(pageIndex: 2),

      body: Stack (

        children: [
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
                  Navigator.of(context).pushReplacement(routeTo(3, const Offset(0, 1.0)));
                },
                direction: "down"
            ),
          ),

          Container(
          padding: const EdgeInsets.only(left: paddingM, right: paddingM),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70,),

              const Text("ABOUT ME", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Container(
                width: 94,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  border: Border.fromBorderSide(BorderSide(width: 0.5))
                ),
              ),

              const SizedBox(height: 42,),

              Container(
                color: Colors.red,
                child: const Text(
                        "Hi, nice to meet you! I am Wendel Sabelo, a Mobile/Web developer from Municpality of Carmen. "
                        "Currently a 3rd year IT student from Davao del Norte "
                        "State College.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text(
                    "With traits of being a hard worker and a creative individual, "
                    "I am eager to expand my field of knowledge.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: CustomButton(
                      onPressed: () {},
                      content: Row(
                        children: [
                          Text(
                            "SEE MORE ABOUT ME",
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),

                          const SizedBox(width: 20,),
                          Icon(Icons.arrow_forward_rounded, color: Theme.of(context).colorScheme.onPrimary,)
                        ],
                      )
                    ),
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }
}