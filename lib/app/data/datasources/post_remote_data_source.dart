import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

final String baseUrl = 'https://jsonplaceholder.typicode.com';

class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<PostModel> posts = body
            .map((dynamic item) => PostModel.fromJson(item))
            .toList();
        return posts;
      }
      throw Exception('Failed to load posts');
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  Future<PostModel> getPostById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts/$id'));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        PostModel post = PostModel.fromJson(body);
        return post;
      }
      throw Exception('Failed to load post');
    } catch (e) {
      throw Exception('Failed to load post: $e');
    }
  }
}
