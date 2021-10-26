import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

//Mock recipe service that fetch sample JSON data to mock recipe request/response
class MockFooderlichService {
  //Batch request that gets both today recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayRecipes, friendPosts);
  }

  //Get sample explore recipes JSON
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    //Simulate API request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    //Load JSON from file
    final dataString =
        await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    //Decode to JSON
    final Map<String, dynamic> json = jsonDecode(dataString);

    //Go through each recipe and convert JSON to ExploreRecipe object
    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((recipe) {
        recipes.add(ExploreRecipe.fromJson(recipe));
      });
      return recipes;
    } else {
      return [];
    }
  }

  //Get the sample friend JSON posts
  Future<List<Post>> _getFriendFeed() async {
    //Simulate API wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    //load JSON file
    final dataString =
      await _loadAsset('assets/sample_data/sample_friends_feed.json');
    //decode to JSON
    final Map<String, dynamic> json = jsonDecode(dataString);

    //Go through each post and convert JSON to Post object
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((post) {
        posts.add(Post.fromJson(post));
      });
      return posts;
    } else {
      return [];
    }
  }

  //Get sample recipe JSON
  Future<List<SimpleRecipe>> getRecipes() async {
    //Simulate API wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    //load JSON file
    final dataString =
      await _loadAsset('assets/sample_data/sample_recipes.json');
    //decode to JSON
    final Map<String, dynamic> json = jsonDecode(dataString);

    //Go through each post and convert JSON to Post object
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((recipe) {
        recipes.add(SimpleRecipe.fromJson(recipe));
      });
      return recipes;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}