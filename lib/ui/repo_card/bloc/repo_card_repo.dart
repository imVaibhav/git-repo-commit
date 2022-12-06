import 'package:git_commits/api/api_provider.dart';
import 'package:git_commits/models/git_repo_commits_model.dart';

class RepoCardRepo {
  ApiProvider _apiProvider = ApiProvider.getInstance();

  Future<List<GitRepoCommits>> getGitRepoDetails(
      String repoName, String user) async {
    try {
      var response = await _apiProvider.getGitRepoDetails(repoName, user);
      if (response == null) {
        return null;
      }
      return gitRepoCommitsFromJson(response.body);
    } catch (e) {
      return null;
    }
  }
}
