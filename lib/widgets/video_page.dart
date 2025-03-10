import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoWidget extends StatefulWidget {
  final String assetImage;
  final String heading;
  final String authorName;
  final String authorImage;
  final String rating;
  final String timing;
  final VoidCallback onBookmark;
  final bool isBookmarked;

  const VideoWidget({
    super.key,
    required this.assetImage,
    required this.heading,
    required this.authorName,
    required this.authorImage,
    required this.rating,
    required this.timing,
    required this.onBookmark,
    required this.isBookmarked,
  });

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 330,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          widget.assetImage,
                          width: 300,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Star.svg",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(width: 4),
                              Text(widget.rating, style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          icon: Icon(
                            widget.isBookmarked ? FontAwesomeIcons.solidBookmark : FontAwesomeIcons.bookmark,
                            color: widget.isBookmarked ? Colors.red : Colors.black,
                            size: 20,
                          ),
                          onPressed: widget.onBookmark,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(

                        margin: EdgeInsets.all(12.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          widget.heading,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/More.svg",
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          // Author Name
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.authorImage),
                ),
                SizedBox(width: 8),
                Text("${widget.authorName}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );

  }
}