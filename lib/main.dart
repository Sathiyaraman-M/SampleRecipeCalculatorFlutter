import 'package:flutter/material.dart';
import 'package:sample_app/recipe_detail.dart';

import 'ingredient.dart';
import 'recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static List<Recipe> samples = [
    Recipe(
        'Spaghetti and Meatballs',
        'assets/2126711929_ef763de2b3_w.jpg',
        4,
        [
          Ingredient(1, 'box', 'Spaghetti'),
          Ingredient(4, '', 'Frozen Meatballs'),
          Ingredient(0.5, 'jar', 'sauce'),
        ]),
    Recipe(
        'Tomato Soup',
        'assets/27729023535_a57606c1be.jpg',
        2,
        [
          Ingredient(1, 'can', 'Tomato Soup'),
        ]),
    Recipe(
        'Grilled Cheese',
        'assets/3187380632_5056654a19_b.jpg',
        1,
        [
          Ingredient(2, 'slices', 'Cheese'),
          Ingredient(2, 'slices', 'Bread'),
        ]),
    Recipe(
        'Chocolate Chip Cookies',
        'assets/15992102771_b92f4cc00a_b.jpg',
        24,
        [
          Ingredient(4, 'cups', 'flour'),
          Ingredient(2, 'cups', 'sugar'),
          Ingredient(0.5, 'cups', 'chocolate chips'),
        ]),
    Recipe(
        'Taco Salad',
        'assets/8533381643_a31a99e8a6_c.jpg',
        1,
        [
          Ingredient(4, 'oz', 'nachos'),
          Ingredient(3, 'oz', 'taco meat'),
          Ingredient(0.5, 'cup', 'cheese'),
          Ingredient(0.25, 'cup', 'chopped tomatoes'),
        ]),
    Recipe(
        'Hawaiian Pizza',
        'assets/15452035777_294cefced5_c.jpg',
        4,
        [
          Ingredient(1, 'item', 'pizza'),
          Ingredient(1, 'cup', 'pineapple'),
          Ingredient(8, 'oz', 'ham'),
        ]),
  ];

  Widget buildCard(Recipe recipe) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial'
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return RecipeDetail(recipe: samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildCard(samples[index]),
            );
          },
        ),
      ),
    );
  }
}
