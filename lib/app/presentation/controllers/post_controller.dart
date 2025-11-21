import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../domain/usecases/get_post_by_id_usecase.dart';

class PostController {
  final GetPostsUseCase getPostsUseCase;
  final GetPostByIdUseCase getPostByIdUseCase;

  PostController(this.getPostsUseCase, this.getPostByIdUseCase);

  Future<List<Post>> getAllPosts() async {
    try {
      return await getPostsUseCase();
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  Future<Post> getPostById(int id) async {
    try {
      return await getPostByIdUseCase(id);
    } catch (e) {
      throw Exception('Failed to load post: $e');
    }
  }
}
