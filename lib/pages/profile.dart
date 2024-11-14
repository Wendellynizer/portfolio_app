import "package:flutter/material.dart";
import "package:portfolio_app/util/util.dart";

import "../components/drawer.dart";

class Profile extends StatelessWidget {
  const Profile({super.key});

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

        title: const  Text("PROFILE", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),


        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
      ),

      drawer: const CustomDrawer(pageIndex: 4),

      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [

                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/images/hex_pattern.png'),fit: BoxFit.cover)
                  ),
                ),

                Positioned (
                  left: paddingM,
                  bottom: 0 + paddingM,
                  child: Container (
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xffE9EFEC),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.mail_rounded, color: highlightColor,),
                        SizedBox(width: 5,),
                        Text(
                            'wendelsabelo27@gmail.com',
                            style: TextStyle(fontSize: 10, color: highlightColor, fontWeight: FontWeight.w500)
                        )
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: primaryColor),
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(image: AssetImage('lib/images/profile.jpg'))
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: paddingM, right: paddingM, bottom: 90, top: 90),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WENDEL SABELO",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: highlightColor),
                  ),

                  Text(
                      "Web/Mobile Developer",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor)
                  ),

                  SizedBox(height: 26,),

                  Text(
                      "I will do the best as I can to help you build your project succesfully. ",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
                  ),

                  SizedBox(height: 50,),

                  Text(
                      "SKILLS",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor)
                  ),

                  SizedBox(height: 16,),


                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      SkillBadge(skillName: "HTML", bgColor: Color(0xFFE44D26)),
                      SkillBadge(skillName: "CSS", bgColor: Color(0xFF379AD6)),
                      SkillBadge(skillName: "JS", bgColor: Color(0xFFF7DF1E)),
                      SkillBadge(skillName: "BOOTSTRAP", bgColor: Color(0xFF563D7C)),
                      SkillBadge(skillName: "PHP", bgColor: Color(0xFF6E81B6)),
                      SkillBadge(skillName: "LARAVEL", bgColor: Color(0xFFFF2D20)),
                      SkillBadge(skillName: "MYSQL", bgColor: Color(0xFF015F8B)),
                      SkillBadge(skillName: "JAVA", bgColor: Color(0xFFE92C30)),
                      SkillBadge(skillName: "GODOT", bgColor: Color(0xFF478CBF)),
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      )  
    );
  }
}

class SkillBadge extends StatelessWidget {
  final String skillName;
  final Color? bgColor;
  const SkillBadge({super.key, required this.skillName, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(
          skillName,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
      ),
    );
  }
}

