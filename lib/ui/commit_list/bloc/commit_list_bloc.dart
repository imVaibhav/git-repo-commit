import 'package:bloc/bloc.dart';
import 'package:git_commits/models/git_repo_model.dart';
import 'package:git_commits/ui/commit_list/bloc/commit_list_repo.dart';
import 'package:meta/meta.dart';

part 'commit_list_event.dart';
part 'commit_list_state.dart';

class CommitListBloc extends Bloc<CommitListEvent, CommitListState> {
  CommitListRepo _repo;
  CommitListBloc(this._repo) : super(LoadingCommits()) {
    on<CommitListEvent>((event, emit) async {
      if (event is fetchCommits) {
        var temp = await _repo.getGitRepos();
        if (temp == null) {
          emit(Error());
        } else {
          emit(ShowCommits(temp));
        }
      }
    });
  }
}
