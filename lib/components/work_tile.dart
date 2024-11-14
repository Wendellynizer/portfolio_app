import "package:flutter/material.dart";

class WorkTile extends StatelessWidget {

  final String imagePath;
  final String name;
  final String description;
  final double fontSize;

  const WorkTile({super.key, required this.imagePath, required this.name, required this.fontSize, required this.description});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // image
          Image(image: AssetImage(imagePath), width: 120,),

          const SizedBox(width: 10,),
          // name and description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //name
              // Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
              Text(name, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
              //description
              Text(description, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0x99000000)))
            ],
          )
        ]

      ),
    );
  }
}
