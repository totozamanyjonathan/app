import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getAllPosts() async {
    return await remoteDataSource.getAllPosts();
  }

  @override
  Future<Post> getPostById(int id) async {
    return await remoteDataSource.getPostById(id);
  }
}
