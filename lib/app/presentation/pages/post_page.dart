import 'package:auto_route/auto_route.dart';
import 'package:app/app/data/datasources/post_remote_data_source.dart';
import 'package:app/app/data/repositories/post_repository_impl.dart';
import 'package:app/app/domain/entities/post.dart';
import 'package:app/app/domain/usecases/get_post_by_id_usecase.dart';
import 'package:app/app/domain/usecases/get_posts_usecase.dart';
import 'package:app/app/presentation/controllers/post_controller.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final PostController postController;
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final postRemoteDataSource = PostRemoteDataSource();
    final postRepository = PostRepositoryImpl(
      remoteDataSource: postRemoteDataSource,
    );
    final getPostsUseCase = GetPostsUseCase(postRepository);
    final getPostByIdUseCase = GetPostByIdUseCase(postRepository);
    postController = PostController(getPostsUseCase, getPostByIdUseCase);

    initialisationPosts();
  }

  Future<void> initialisationPosts() async {
    await Future.delayed(Duration(seconds: 4));
    posts = await postController.getAllPosts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Page')),
      body: (!isLoading)
          ? ListView.builder(
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(post.title),
                );
              },
              itemCount: posts.length,
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text("Loading...")],
              ),
            ),
    );
  }
}
