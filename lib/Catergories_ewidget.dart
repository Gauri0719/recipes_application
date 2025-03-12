import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class catergories_widget extends StatelessWidget {
  const catergories_widget({
    super.key,
    required this.title,
    required this.image,
    required this.time,
    required this.onBookmark,
  });
  final String title;
  final String image;
  final String time;
  final VoidCallback onBookmark;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          margin: EdgeInsets.only(bottom: 16),
          child: Stack(
            clipBehavior: Clip.none, // Allows image to be placed outside the container
            children: [
              // Card Container
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                margin: EdgeInsets.only(top: 40), // Makes space for the image above
                child: Column(
                  children: [
                    SizedBox(height: 50), // Space for the floating image
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("⏳ $time", style: TextStyle(color: Colors.grey)),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.bookmark),
                          onPressed: onBookmark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Floating Image
              Positioned(
                top: -20, // Moves image above the container
                left: 20,
                right: 20,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}