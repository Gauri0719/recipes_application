import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Title
            const Text(
              "How to make French Toast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Video Thumbnail
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/french_toast.jpg",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black54,
                  child: Icon(FontAwesomeIcons.play, color: Colors.white, size: 40),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Rating and Reviews
            Row(
              children: [
                const Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 20),
                const Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 20),
                const Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 20),
                const Icon(FontAwesomeIcons.solidStar, color: Colors.orange, size: 20),
                const Icon(FontAwesomeIcons.starHalfStroke, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                const Text(
                  "4.5 (300 Reviews)",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Author Section
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/chef-69.jpg"),
                  radius: 22,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Roberta Anny",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Bali, Indonesia",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Follow", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Ingredients Title
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Ingredients List
            Column(
              children: [
                ingredientItem("assets/images/bread.jpg", "Bread", "200g"),
                ingredientItem("assets/images/eggs.jpg", "Eggs", "200g"),
                ingredientItem("assets/images/milk.jpg", "Milk", "200g"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ingredientItem(String image, String name, String quantity) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Image.asset(image, width: 40, height: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Text(quantity, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
