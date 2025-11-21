import 'package:app/app/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
  Future<Post> getPostById(int id);
}
