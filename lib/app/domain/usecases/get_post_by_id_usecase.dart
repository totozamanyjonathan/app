import 'package:app/app/domain/entities/post.dart';
import 'package:app/app/domain/repositories/post_repository.dart';

class GetPostByIdUseCase {
  final PostRepository repository;

  GetPostByIdUseCase(this.repository);

  Future<Post> call(int id) {
    return repository.getPostById(id);
  }
}
