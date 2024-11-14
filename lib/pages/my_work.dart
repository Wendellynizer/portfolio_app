import 'package:flutter/material.dart';
import 'package:portfolio_app/components/drawer.dart';
import 'package:portfolio_app/components/work_tile.dart';

import '../util/routes.dart';
import '../util/util.dart';

class MyWorkPage extends StatelessWidget {
  const MyWorkPage({super.key});

  @override
  Widget build(BuildContext context) {

    List works = [
      ["lib/images/chipptech-01.png", "ChipTech Ecommerce Website", "Web Design"],
      ["lib/images/nyanchat.jpg", "Nyan Chat", "Chat System Website"],
      ["lib/images/csms.png", "Carmen Scholarship Management System", "Chat System Website"],
      ["lib/images/findingshark.png", "Finding Sharks", "Mobile Application"],
      ["lib/images/shopX.png", "ShopX 2nd Hand Ecommerce Website", "Ecommerce Website"],
      // []
    ];

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
                Navigator.of(context).pushReplacement(routeTo(2, const Offset(0, -1.0)));
              },
              icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 40,)
          ),
        ],

        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),
      
      drawer: const CustomDrawer(pageIndex: 3),

      body: Stack(
        children: [
          // design
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70,),

              const Text("MY WORKS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Container(
                width: 94,
                decoration: const BoxDecoration(
                    color: Colors.black87,
                    border: Border.fromBorderSide(BorderSide(width: 0.5))
                ),
              ),

              const SizedBox(height: 20,),

              // WorkTile(imagePath: works[0][0], name: works[0][1], description: works[0][1])

              Expanded(
                child: ListView.builder(
                  itemCount: works.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: WorkTile(
                          imagePath: works[index][0],
                          name: works[index][1],
                          description: works[index][2],
                          fontSize: (index == 2 || index == works.length - 1)? 10 : 14
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
