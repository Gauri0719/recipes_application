import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  List<Map<String, String>> bookmarkedVideos = [];

  void toggleBookmark(String title, String url) {
    setState(() {
      final index = bookmarkedVideos.indexWhere((video) => video['title'] == title);
      if (index == -1) {
        bookmarkedVideos.add({'title': title, 'url': url});
      } else {
        bookmarkedVideos.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "See All Recipes",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: videoList.length,
          itemBuilder: (context, index) {
            final video = videoList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 6,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: Image.asset(
                      video['url']!,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video['title']!,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(video['authorImage'] ?? "assets/images/default.jpg"),
                                radius: 14,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  video['author'] ?? "Unknown",
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "⭐ ${video['rating']!}",
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "⏳ ${video['timing']!}",
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      bookmarkedVideos.any((v) => v['title'] == video['title'])
                          ?  FontAwesomeIcons.solidBookmark
                          :  FontAwesomeIcons.bookmark ,
                      color: Colors.red,
                    ),
                    onPressed: () => toggleBookmark(video['title']!, video['url']!),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Map<String, String>> videoList = [
  {
    "title": "How to make Sushi at Home",
    "url": "assets/images/sushi2.jpg",
    "author": "Niki Samthana",
    "authorImage": "assets/images/chef-69.jpg",
    "rating": "4.5",
    "timing": "15:10",
  },
  {
    "title": "Turkish Delight Sweet",
    "url": "assets/images/recipess.png",
    "author": "Shravani Barawde",
    "authorImage": "assets/images/chef2.jpg",
    "rating": "4.7",
    "timing": "7:09",
  },
  {
    "title": "Easy Butter Chicken",
    "url": "assets/images/Easy-Butter-Chicken-TIMG.jpg",
    "author": "Anmothy Gilves",
    "authorImage": "assets/images/chef3.jpg",
    "rating": "4.0",
    "timing": "5:30",
  },
  {
    "title": "Crepes at Home",
    "url": "assets/images/crepes.jpg",
    "author": "Himanshu",
    "authorImage": "assets/images/creator2.jpg",
    "rating": "5.0",
    "timing": "3:40",
  },
  {
    "title": "Biryani",
    "url": "assets/images/biryani.jpg",
    "author": "Sushmita Mesta",
    "authorImage": "assets/images/biryani.jpg",
    "rating": "5.0",
    "timing": "3:40",
  },
  {
    "title": "Kolhapuri Rassa",
    "url": "assets/images/download2.jpg",
    "author": "Suman",
    "authorImage": "assets/images/download2.jpg",
    "rating": "5.0",
    "timing": "3:40",
  },
];
