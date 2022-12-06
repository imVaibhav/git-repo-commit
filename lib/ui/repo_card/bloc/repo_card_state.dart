part of 'repo_card_bloc.dart';

@immutable
abstract class RepoCardState {}

class RepoCardInitial extends RepoCardState {}

class LoadingDetails extends RepoCardState {}

class Error extends RepoCardState {}

class ShowDetails extends RepoCardState {
  List<GitRepoCommits> data;
  ShowDetails(this.data);
}
