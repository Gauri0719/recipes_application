import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Selected category
  var selectedCategory = "Breakfast".obs;

  // Recipe data based on category
  final Map<String, List<Map<String, String>>> recipesByCategory = {
    "Salad": [
      {"name": "Caesar Salad", "image": "assets/images/Caesar_salad_(2).jpg", "time": "15 Mins"},
      {"name": "Greek Salad", "image": "assets/images/Food Photo.png", "time": "10 Mins"},
    ],
    "Breakfast": [
      {"name": "Pepper sweetcorn ramen", "image": "assets/images/ramen.jpg", "time": "10 Mins"},
      {"name": "Cheddar cheese and shell salad", "image": "assets/images/greek-salad-3814-1.jpeg", "time": "20 Mins"},
    ],
    "Appetizer": [
      {"name": "Garlic Bread", "image": "assets/images/homemade-garlic-bread-6.jpg", "time": "8 Mins"},
      {"name": "Spring Rolls", "image": "assets/images/19492-Thai_Chicken_Spring_Roll.webp", "time": "12 Mins"},
    ],
    "Noodle": [
      {"name": "Garlic Noodle", "image": "assets/images/19492-Thai_Chicken_Spring_Roll.webp", "time": "8 Mins"},
      {"name": "Spring Rolls", "image": "assets/images/ramen.jpg", "time": "12 Mins"},
    ],
    "Lunch": [
      {"name": "Paneer Lababdar", "image":"assets/images/19492-Thai_Chicken_Spring_Roll.webp", "time": "8 Mins"},
      {"name": "Veg Thali", "image": "assets/images/Food Photo.png", "time": "12 Mins"},
    ],
  };

  // Get recipes based on selected category
  List<Map<String, String>> get recipes => recipesByCategory[selectedCategory.value] ?? [];

  // Update category when clicked
  void updateCategory(String category) {
    selectedCategory.value = category;
  }
}
