import 'package:day_5/data_service.dart';
import 'package:day_5/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPost() async => emit(await _dataService.getPosts());
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>(_loadPost);
    // on<RefreshPostsEvent>(_loadPost);
  }

  void _loadPost(LoadPostsEvent event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());
    try {
      final posts = await _dataService.getPosts();
      emit(LoadPostsSucessState(posts: posts));
    } catch (e) {
      emit(LoadPostsFailState(error: e));
    }
  }

  Future<void> _refreshPost(
      LoadPostsEvent event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());
    try {
      final posts = await _dataService.getPosts();
      emit(LoadPostsSucessState(posts: posts));
    } catch (e) {
      emit(LoadPostsFailState(error: e));
    }
  }
}

// void _refreshPosts(RefreshPostsEvent event, Emitter<PostsState> emit)

//Events
abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class RefreshPostsEvent extends PostsEvent {}

// States
abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadPostsSucessState extends PostsState {
  List<Post> posts;
  LoadPostsSucessState({required this.posts});
}

class LoadPostsFailState extends PostsState {
  Object error;
  LoadPostsFailState({required this.error});
}
