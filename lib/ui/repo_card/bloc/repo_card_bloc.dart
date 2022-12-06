import 'package:bloc/bloc.dart';
import 'package:git_commits/models/git_repo_commits_model.dart';
import 'package:git_commits/models/git_repo_model.dart';
import 'package:git_commits/ui/commit_list/bloc/commit_list_bloc.dart';
import 'package:git_commits/ui/repo_card/bloc/repo_card_repo.dart';
import 'package:meta/meta.dart';

part 'repo_card_event.dart';
part 'repo_card_state.dart';

class RepoCardBloc extends Bloc<RepoCardEvent, RepoCardState> {
  RepoCardRepo _repo = RepoCardRepo();
  RepoCardBloc() : super(RepoCardInitial()) {
    on<RepoCardEvent>((event, emit) async {
      if (event is FetchRepoCommit) {
        emit(LoadingDetails());
        var tempDetails = await _repo.getGitRepoDetails(
            event.repo.name, event.repo.owner.login);
        if (tempDetails == null)
          emit(Error());
        else {
          emit(ShowDetails(tempDetails));
        }
      }
    });
  }
}
