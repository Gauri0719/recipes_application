import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recipes_application/recipe_detail_page.dart';
import 'package:recipes_application/see_all_page.dart';
import 'package:recipes_application/sign_in_page.dart';
import 'package:recipes_application/widgets/video_page.dart';

import 'Catergories_ewidget.dart';
import 'bookmarked_page.dart';
import 'controller/category_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
final CategoryController categoryController = Get.put(CategoryController());
class _HomePageState extends State<HomePage> {
  List<Map<String, String>> bookmarkedVideos = [];
  int _selectedCategoryIndex = 0; // Track the selected category
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
  final List<String> categories = ["Salad", "Breakfast", "Appetizer", "Noodle", "Lunch"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children:[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Find Best Recipes for Cooking",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 35.0,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Search Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 50),
                        backgroundColor: Colors.white, // Button background color
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey, width: 1), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/searchbar.svg",
                            semanticsLabel: 'Search Icon',
                            height: 20.0,
                            width: 20.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Search Recipes",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Trending Now
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Text(
                          "Trending Now 🔥",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>SeeAllPage()));
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Icon(FontAwesomeIcons.arrowRight, color: Colors.red, size: 20),
                      ],
                    ),
                  ),

                  // Video List (Horizontal Scroll)
                  SizedBox(
                    height: 300, // Set height to prevent layout issues
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        VideoWidget(
                          assetImage: "assets/images/sushi2.jpg",
                          heading: "How to make Sushi at Home",
                          authorName: " By Niki Samthana",
                          authorImage: "assets/images/chef-69.jpg",
                          rating: "4.5",
                          timing: "15:10",
                          isBookmarked: bookmarkedVideos.any((video) => video['title'] == "How to make Sushi at Home"),
                          onBookmark: () => toggleBookmark("How to make Sushi at Home", "assets/images/sushi2.jpg"),
                        ),
                        VideoWidget(
                          assetImage: "assets/images/recipess.png",
                          heading: "Turkish Delight Sweet",
                          authorName: "By Shravani Barawde",
                          authorImage: "assets/images/chef2.jpg",
                          rating: "4.7",
                          timing: "7:09",
                          isBookmarked: bookmarkedVideos.any((video) => video['title'] == "Turkish Delight Sweet"),
                          onBookmark: () => toggleBookmark("Turkish Delight Sweet", "assets/images/recipess.png"),
                        ),
                        VideoWidget(
                          assetImage: "assets/images/Easy-Butter-Chicken-TIMG.jpg",
                          heading: "Easy Butter Chicken",
                          authorName: "By Anmothy Gilves",
                          authorImage: "assets/images/chef3.jpg",
                          rating: "4.0",
                          timing: "5:30",
                          isBookmarked: bookmarkedVideos.any((video) => video['title'] == "Easy Butter Chicken"),
                          onBookmark: () => toggleBookmark("Easy Butter Chicken", "assets/images/Easy-Butter-Chicken-TIMG.jpg"),
                        ),
                        VideoWidget(
                          assetImage: "assets/images/crepes.jpg",
                          heading: "Crepes at Home",
                          authorName: "By Himanshu",
                          authorImage: "assets/images/creator2.jpg",
                          timing: "3:40",
                          rating: "5.0",
                          isBookmarked: bookmarkedVideos.any((video) => video['title'] == "Crepes at Home"),
                          onBookmark: () => toggleBookmark("Crepes at Home", "assets/images/crepes.jpg"),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: 10.0),

                  // Popular Category
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Popular Category",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  // Category Row
                  // Category Row (Now Clickable)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: categories.map((category) {
                      return Obx(() => GestureDetector(
                        onTap: () => categoryController.updateCategory(category),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: categoryController.selectedCategory.value == category
                                ? Colors.red
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: categoryController.selectedCategory.value == category
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ));
                    }).toList(),
                  ),

                  SizedBox(height: 20),

                  // DYNAMICALLY UPDATED RECIPE CARDS
                  SizedBox(
                    height: 200, // Adjust height based on card size
                    child: Obx(() {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal, // Horizontal scrolling
                        itemCount: categoryController.recipes.length,
                        separatorBuilder: (context, index) => SizedBox(width: 16), // Even spacing
                        itemBuilder: (context, index) {
                          final recipe = categoryController.recipes[index];
                          return Container(
                            width: 160, // Card width
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    recipe["image"]!,
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),

                                // Recipe Name
                                Text(
                                  recipe["name"]!,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 4),

                                // Time & Bookmark Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "⏳${recipe["time"]}",
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Icon(FontAwesomeIcons.bookmark, color: Colors.grey,size: 15.0,),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Recipes",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),

                        Row(
                          children: [
                            Text("See all",style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,color: Colors.red),
                            ),
                            Icon(FontAwesomeIcons.arrowRight,color: Colors.red,)
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset()
                        ],
                      )
                    ],
                  )

                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                // width: MediaQuery.of(context).size.width * 0.8, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    IconButton(icon: Icon(FontAwesomeIcons.house, size: 20), onPressed: () {}),
                    IconButton(icon: Icon(FontAwesomeIcons.bookmark, size: 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookmarkPage(bookmarkedVideos: bookmarkedVideos),
                          ),
                        );
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetailPage()));
                      }, // Add action
                      backgroundColor: Colors.red,
                      child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                    ),
                    IconButton(icon: Icon(FontAwesomeIcons.bell, size: 20), onPressed: () {}),
                    IconButton(icon: Icon(FontAwesomeIcons.user, size: 20), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                    }),
                  ],
                ),
              ),
            ),
          ]
        )
      )
    );


  }

  // Widget to create category item
  Widget _categoryItem(String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? Colors.red : Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}


