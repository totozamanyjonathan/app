import 'package:app/app/domain/entities/post.dart';
import 'package:app/app/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call() {
    return repository.getAllPosts();
  }
}
