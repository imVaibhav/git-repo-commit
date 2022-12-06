part of 'repo_card_bloc.dart';

@immutable
abstract class RepoCardEvent {}

class FetchRepoCommit extends RepoCardEvent {
  GitRepos repo;
  FetchRepoCommit(this.repo);
}
